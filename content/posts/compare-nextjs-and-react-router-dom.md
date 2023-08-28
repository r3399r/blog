---
title: 為何使用 Next.js 與如何透過 AWS 實作
date: 2023-08-28T16:30:12+08:00
draft: false
---
<!--more-->
## React 的缺點
### 渲染時間
在實作 React 前端網頁程式時，有一個無法避免的問題，就是使用者在進入時到看到畫面之間的「渲染時間」。

原因在於，諸如 React 此類的 SPA，都是需要使用者先下載好靜態檔案，再藉由 javascript 當場把畫面渲染出來，所以渲染速度除了網路速度，也會取決於使用者的手機效能好壞。

至於傳統網頁的作法則是把寫好的文章與內容寫死在 html，當使用者下載完靜態檔案，就可以直接呈現出畫面。

我用 React 寫了一個極簡單的網頁程式，將檔案儲存於 AWS S3，再搭配 AWS Cloudfront 分散出去，網址如下：
https://dw55ysums79zr.cloudfront.net

如果你有打開來，應該是感受不到上面提到的「渲染時間」，感覺一打開就看到內容了吧？

但其實，你的瀏覽器得到的 html 是：

```html
<!doctype html>
<html lang="en">

<head>
	<title>React App</title>
	...
</head>

<body><noscript>You need to enable JavaScript to run this app.</noscript>
	<div id="root"></div>
</body>

</html>
```
我們看看 `<body>` 所夾的內容... 內容呢？沒有！因為內容需要等著被渲染。執行到呈現的這段時間，就是「渲染時間」。

### 渲染時間怎麼了嗎
閱讀到這邊，認識了渲染時間，也看了一個實際的例子，你可能會想... 所以呢？渲染時間怎麼了嗎？短到根本感受不到，那是有什麼問題呢？

問題就在於... GOOGLE 覺得這時間太久了

大家也許知道，GOOGLE 搜尋引擎每天會在網路上爬數以千萬億計的網頁，精進他的搜尋引擎，改善他的搜尋結果，提升使用者的使用體驗，而它在各個網頁停留的時間不會太久，也許看第一眼就走了，根本不會等網頁渲染出來。雖然如今的 GOOGLE 已經可以處理這些 SPA 的網頁程式渲染的內容，但，可能需要一些時間，而這可能會對 SEO 產生一些影響，誰知道要等多久呢？如果開發者能夠把渲染時間歸零，那對於 SEO 一定有正向幫助的。

## 介紹 Next.js

Next.js 是一個基於 React 所發展出來的框架，旨在使 React 應用程序的構建過程更簡單且更具優化。它提供了許多功能，這裡只簡單提跟這篇有關的功能。

### SSR (Server-Side Rendering)
Next.js 提供了一個很重要的功能就是 SSR，照字面上的意思就是讓網頁程式先在伺服器上進行渲染，渲染後再傳給使用者，得以使初始頁面載入速度更快，提供更佳的 SEO，並解決上面提到的問題。

#### 當 SSR 遇上 AWS S3

如果你希望節省開銷，不想要開一個全天候執行的伺服器，那就是把靜態網頁放在一個能託管的空間，例如 github、AWS S3...。由於作者本人是 AWS 的重度依賴者，幾乎所有我的網頁程式都是放在 AWS S3，（這個部落格則是放在 github），成本是低到跟沒有一樣。

但這就是最大的問題了，如果沒有一個伺服器在背後運作，那就不可能做到 SSR，因為沒那個機制讓它先渲染好再傳給使用者載入。

如果不想開伺服器，那就只能在這裡說再見了。再見

### SSG (Static Site Generation)

好在，強大的 Next.js 還提供了另一個很符合需求的功能 SSG，這是開發者在建立靜態網頁時，先進行預渲染，產生渲染好的 html，這樣就可以直接讓使用者下載渲染好的 html 檔案了。

然後我就用 Next.js 實作了一個跟前面範例有著一模一樣內容的網頁程式，也搭配 AWS S3 與 AWS Cloudfront 進行部署：
https://dh671vgenvi0d.cloudfront.net

打開來是一樣的內容，實際上瀏覽器看到的 html 是這個：

```html
<!DOCTYPE html>
<html lang="en">

<head>
	<title>Next App</title>
	...
</head>

<body>
	<div id="__next">
		<div class="bg-yellow-100">
			<div>This is Home Page</div><a class="border border-black" href="/about">Go to About Page</a>
		</div>
	</div>
	<script id="__NEXT_DATA__" type="application/json">
		{"props":{"pageProps":{}},"page":"/","query":{},"buildId":"BfXAJr1CBZN1FIHlb6HCR","nextExport":true,"autoExport":true,"isFallback":false,"scriptLoader":[]}
	</script>
</body>

</html>
```
我們看看這次 `<body>` 所夾的內容... 這次有直接看到了一些 `<div>` 之類的 html 元件，也就是網頁的實際內容。

## 分頁問題

雖然 Next.js 提供的 SSG 功能看似完美的解決了問題，但問題出在分頁的時候。一般來說一個網站應該不會只有一頁吧？

雖然 SPA 的原意就是一頁式網站，只有主頁，內容完全靠 javascript 渲染，但對於使用者體驗，會覺得頁面切換時，網址也要跟著切換，而且可以直接用不同的網址進入不同的頁面。這點小事，居然在 Next.js 面臨了巨大的困難！

### React 解方

一般來說，未使用 Next.js 時，會使用 `React-router-dom` 這個 React 套件來處理路徑問題，也非常完美的可以處理，第一個範例正式使用這個套件處理的。程式碼請見最下方。

### Next.js 解方

坦白說，問題不在 Next.js，問題在於我一定要用 SSG 這個預先渲染的方式產生靜態網頁，不然 SSR 就好了啊！真是一關接著一關。

要解決此問題，先理解問題來自哪裡，因為從 Cloudfront 進入時，AWS 會轉址到 S3 的 html 檔案，而在設定 S3 託管時會設定一個主頁用的 html，所以不管是從怎麼樣的路徑進入，都會轉到 index.html，那呈現的永遠都是首頁，而不會是分頁。

大概知道機制之後，那要切入的地方就是讓 Cloudfront 轉址時，轉到我們希望的檔案上，要使用 Cloudfront 裡 Lambda@Edge 的設定，

先建立 Lambda，記得要在 us-east-1 建立，因為這個函數會跟著 Cloudfront，所以在哪個區域其實沒差，應該只是 AWS 都把 Lambda@Edge 在這個區域管理

這裡直接貼程式碼，因為 github 裡並沒有包含這部分
```js
const hasExtension = /(.+)\.[a-zA-Z0-9]{2,5}$/;
const hasSlash = /\/$/;

export const handler = async (event) => {
  const { request } = event.Records[0].cf;
  const uri = request.uri;
  
  const isDynamic = uri.indexOf("/about/");
  if (uri && !uri.match(hasExtension) && !uri.match(hasSlash) && isDynamic>-1) {
      request.uri=`${uri.substr(0,uri.lastIndexOf("/"))}/[slug].html`;
  } else if (uri && !uri.match(hasExtension) && !uri.match(hasSlash)) { 
      request.uri = `${uri}.html`; 
  } 
  return request;
};
```

整理邏輯就是，當 Cloudfront 收到請求時，先經過這個 Lambda，於判斷路徑後，更改請求的目標網址。這樣就會指到正確的網址了。完成之後要 Publish 一個版本才能使用。

Cloudfront 的 Lambda@Edge 設定要去 Edit Behavior 的 Function associations
<div >
<img src="/images/cloudfront-lambdaEdge.png" >
</div>

這樣就完成了！

有個問題是部署的自動化，因為 lambda 函數的內容是 depends on 分頁路徑，每次都一定要來更改才能正常運作。再加上一定要在 us-east-1，讓部署多了一點複雜度。

## What's Next?

接下來要挑戰 Next.js & React-router-dom 的混合使用，假如網頁程式有大量的動態內容，那根本不需要預渲染，如果可以只讓指定的頁面進行預渲染，其他的就用 React-router-dom 處理，那就雙贏了！賺了 SEO，也賺了開發的維護性。等成功實作之後再來分享！

## Github Source
Next.js https://github.com/r3399r/ceres/tree/main/nextjs-demo

React https://github.com/r3399r/ceres/tree/main/reactjs-demo
