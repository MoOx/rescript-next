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

  @send
  external on: (
    routerEvent,
    @string
    [
      | #routeChangeStart(string => unit)
      | #routeChangeComplete(string => unit)
      | #hashChangeComplete(string => unit)
    ],
  ) => unit = "on"

  @send
  external off: (
    routerEvent,
    @string
    [
      | #routeChangeStart(string => unit)
      | #routeChangeComplete(string => unit)
      | #hashChangeComplete(string => unit)
    ],
  ) => unit = "off"

  type router = {
    route: string,
    asPath: string,
    events: routerEvent,
    pathname: string,
    query: Js.Dict.t<string>,
  }

  type path = {
    pathname: string,
    query: Js.Dict.t<string>,
  }

  @send external push: (router, string) => unit = "push"
  @send external pushObj: (router, path) => unit = "push"

  @send external replace: (router, string) => unit = "replace"
  @send external replaceObj: (router, path) => unit = "replace"

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

    type context<'props, 'params> = {
      params: Js.t<'params>,
      query: Js.Dict.t<string>,
      req: req,
      res: res,
    }

    type serverSideProps<'props, 'params> = context<'props, 'params> => Js.Promise.t<{
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
    type context<'props, 'params> = {
      params: 'params,
      query: Js.Dict.t<string>,
      req: Js.Nullable.t<Js.t<'props>>,
    }

    type t<'props, 'params> = context<'props, 'params> => Js.Promise.t<{"props": 'props}>

    type revalidate<'props, 'params> = context<'props, 'params> => Js.Promise.t<{
      "props": 'props,
      "revalidate": int,
    }>
  }
}
