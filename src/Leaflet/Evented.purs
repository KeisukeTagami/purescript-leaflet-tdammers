module Leaflet.Evented where

import Prelude
import Effect

class Evented t e h a | t -> e, t -> h where
  on ::
    forall eff.
    t ->
    a ->
    (e -> Effect Unit) ->
    Effect h
  off ::
    forall eff.
    t ->
    a ->
    h ->
    Effect Unit
