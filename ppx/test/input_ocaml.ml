[@@@react.dom]

let%component make ?(name = "") =
  div ~children:[React.string ("Hello " ^ name)] ()

let element = div ~id:"foo" ~children:[] ()

let element =
  a ~id:"foo" ~href:"https://www.hello.com" ~children:[React.string "hello"] ()

let%component make ~children:(first, second) =
  div ~id:"foo" ~children:[first; second] ()

let%component make ~children:kids = div ~id:"foo" ~children:kids ()

let%component make ~children:(first, second) () =
  div ~children:[first; second] ()

let%component make ?(name = "") = div ~children:[name] ()

let%component make () = a ?href:(Some "https://opam.ocaml.org") ()

let%component make ~(bar : int option) =
  div ~children:[React.string (string_of_int (Option.value ~default:0 bar))] ()

external%component make : name:Js.js_string Js.t -> React.element
  = "require(\"my-react-library\").MyReactComponent"

external%component make : ?name:Js.js_string Js.t -> React.element
  = "require(\"my-react-library\").MyReactComponent"
