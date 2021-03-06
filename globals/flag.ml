(*
 * Copyright 2010, INRIA, University of Copenhagen
 * Julia Lawall, Rene Rydhof Hansen, Gilles Muller, Nicolas Palix
 * Copyright 2005-2009, Ecole des Mines de Nantes, University of Copenhagen
 * Yoann Padioleau, Julia Lawall, Rene Rydhof Hansen, Henrik Stuart, Gilles Muller, Nicolas Palix
 * This file is part of Coccinelle.
 *
 * Coccinelle is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, according to version 2 of the License.
 *
 * Coccinelle is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with Coccinelle.  If not, see <http://www.gnu.org/licenses/>.
 *
 * The authors reserve the right to distribute this or future versions of
 * Coccinelle under other licenses.
 *)


let sgrep_mode2 = ref false

let show_misc = ref true

let show_transinfo = ref false

let show_trying = ref false

let track_iso_usage = ref false

type scanner = IdUtils | Glimpse | Grep | Google of string | NoScanner
let scanner = ref Grep

let pyoutput = ref "coccilib.output.Console"

let ocamlc = ref "ocamlc"
let ocamlopt = ref "ocamlopt"
let ocamldep = ref "ocamldep"
let ocamlfind = ref "ocamlfind"

(*"Some" value is the path with respect to which the patch should be created*)
let patch = ref (None : string option)

let make_hrule = ref (None : string (*dir*) option)
let hrule_per_file = ref true (* if false, then a rule per function *)

let currentfile = ref (None : string option)

let current_element = ref ""
let dir = ref ""

let defined_virtual_rules = ref ([] : string list)
let defined_virtual_env = ref ([] : (string*string) list)

let set_defined_virtual_rules s =
  match Str.split (Str.regexp "=") s with
    [name;vl] -> defined_virtual_env := (name,vl) :: !defined_virtual_env
  | _ -> defined_virtual_rules := s :: !defined_virtual_rules

let c_plus_plus = ref false
