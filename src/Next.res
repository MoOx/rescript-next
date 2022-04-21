// https://nextjs.org/docs
// https://github.com/zeit/next.js/blob/canary/packages/next/types/index.d.ts

module Dynamic = {
  type options = {
    ssr: option<bool>,
    loading: option<unit => React.element>,
  }

  @module("next/dynamic")
  external dynamic: (unit => Js.Promise.t<'a>, options) => 'a = "default"
}

module Error = {
  @module("next/error") @react.component
  external make: (~statusCode: int, ~children: React.element) => React.element = "default"
}

module Head = {
  @module("next/head") @react.component
  external make: (~children: React.element) => React.element = "default"
}

// https://nextjs.org/docs/api-reference/next/image
module Image = {
  type loaderOptions = {
    src: string,
    width: float,
    quality: float,
  }
  @module("next/image") @react.component
  external make: (
    ~alt: string=?,
    ~blurDataURL: string=?,
    ~placeholder: [#blur | #empty]=?,
    ~className: string=?,
    ~height: float=?,
    ~layout: [#fixed | #intrinsic | #responsive | #fill]=?,
    ~loader: loaderOptions => string=?,
    ~loading: [
      | #"lazy"
      | #eager
    ]=?,
    ~priority: bool=?,
    ~objectFit: [
      | #fill
      | #contain
      | #cover
      | #none
      | #"scale-down"
    ]=?,
    ~objectPosition: string=?,
    ~quality: float=?,
    ~sizes: string=?,
    ~src: string,
    ~unoptimized: bool=?,
    ~width: float=?,
  ) => React.element = "default"
}

module Link = {
  @module("next/link") @react.component
  external make: (
    ~_as: string=?,
    ~children: React.element,
    ~className: option<string>=?,
    ~href: string,
    ~passHref: option<bool>=?,
    ~prefetch: bool=?,
    ~replace: option<bool>=?,
    ~shallow: option<bool>=?,
  ) => React.element = "default"
}

module Router = {
  type routerEvent

  type routerEventOptions = {shallow: bool}

  @send
  external on: (
    routerEvent,
    @string
    [
      | #routeChangeStart((string, routerEventOptions) => unit)
      | #routeChangeComplete((string, routerEventOptions) => unit)
      | #routeChangeError((string, routerEventOptions) => unit)
      | #beforeHistoryChange((string, routerEventOptions) => unit)
      | #hashChangeStart((string, routerEventOptions) => unit)
      | #hashChangeComplete((string, routerEventOptions) => unit)
    ],
  ) => unit = "on"

  @send
  external off: (
    routerEvent,
    @string
    [
      | #routeChangeStart((string, routerEventOptions) => unit)
      | #routeChangeComplete((string, routerEventOptions) => unit)
      | #routeChangeError((string, routerEventOptions) => unit)
      | #beforeHistoryChange((string, routerEventOptions) => unit)
      | #hashChangeStart((string, routerEventOptions) => unit)
      | #hashChangeComplete((string, routerEventOptions) => unit)
    ],
  ) => unit = "off"

  type router = {
    pathname: string,
    query: Js.Dict.t<string>,
    asPath: string,
    isFallback: bool,
    basePath: string,
    locale: string,
    locales: array<string>,
    defaultLocale: string,
    // domainLocales: Array<{domain, defaultLocale, locales}>, // @todo
    isReady: bool,
    isPreview: bool,
    events: routerEvent,
  }

  type path = {
    pathname: string,
    query: Js.Dict.t<string>,
  }

  type options = {
    scroll: bool,
    shallow: bool,
    locale: string,
  }

  @send external push: (router, string) => unit = "push"
  @send external pushWithOptions: (router, string, options) => unit = "push"
  @send external pushObj: (router, path) => unit = "push"
  @send external pushObjWithOptions: (router, path, options) => unit = "push"

  @send external replace: (router, string) => unit = "replace"
  @send external replaceWithOptions: (router, string, options) => unit = "replace"
  @send external replaceObj: (router, path) => unit = "replace"
  @send external replaceObjWithOptions: (router, path, options) => unit = "replace"

  @send external prefetch: (router, string) => unit = "prefetch"
  @send
  external beforePopState: (router, (string, string, options) => unit) => unit = "beforePopState"
  @send external back: router => unit = "back"
  @send external reload: router => unit = "reload"

  @module("next/router") external useRouter: unit => router = "useRouter"
}

module Page = {
  module GetServerSideProps = {
    type req

    type res
    module Res = {
      @send external setHeader: (res, string, string) => unit = "setHeader"
      @send external write: (res, string) => unit = "write"
      @send external end_: res => unit = "end"
    }

    type context<'props, 'params, 'previewData> = {
      params: Js.t<'params>,
      req: req,
      res: res,
      query: Js.Dict.t<string>,
      preview: bool,
      previewData: 'previewData,
      resolvedUrl: string,
      locale: string,
      locales: array<string>,
      defaultLocale: string,
    }

    type serverSideProps<'props, 'params, 'previewData> = context<
      'props,
      'params,
      'previewData,
    > => Js.Promise.t<{
      "props": 'props,
    }>
  }

  module GetStaticPaths = {
    type path<'params> = {params: 'params}

    type return<'params> = {
      paths: array<path<'params>>,
      fallback: bool,
    }

    type t<'params> = unit => Js.Promise.t<return<'params>>
  }
  module GetStaticProps = {
    type context<'props, 'params, 'previewData> = {
      params: 'params,
      preview: bool,
      previewData: 'previewData,
      locale: string,
      locales: array<string>,
      defaultLocale: string,
      query: Js.Dict.t<string>,
    }

    type t<'props, 'params, 'previewData> = context<'props, 'params, 'previewData> => Js.Promise.t<{
      "props": 'props,
    }>

    type revalidate<'props, 'params, 'previewData> = context<
      'props,
      'params,
      'previewData,
    > => Js.Promise.t<{
      "props": 'props,
      "revalidate": int,
    }>
  }
}

module Script = {
  @module("next/script") @react.component
  external make: (
    ~src: string,
    ~strategy: [#beforeInteractive | #afterInteractive | #lazyOnload | #worker],
    ~onLoad: unit => unit=?,
  ) => React.element = "default"
}
