module Leaflet.MouseInteraction where

import Prelude
import Leaflet.LatLng
import Leaflet.Types
import Effect
import Data.Newtype
import Leaflet.Evented

foreign import data MouseEventTarget :: Type

-- | Metadata for a mouse event.
newtype MouseEvent
  = MouseEvent
  { latlng :: LatLng -- ^ Mouse position in geocoordinate space
  , layerPoint :: Point -- ^ Mouse position relative to the layers
  , containerPoint :: Point -- ^ Mouse position relative to the container element
  }

derive instance newtypeMouseEvent :: Newtype MouseEvent _

foreign import data MouseEventHandle :: Type

data MouseEventType
  = MouseMove
  | MouseOver
  | MouseOut
  | MouseUp
  | MouseDown
  | Click
  | DblClick

mouseEventKey :: MouseEventType -> String
mouseEventKey MouseMove = "mousemove"

mouseEventKey MouseOver = "mouseover"

mouseEventKey MouseOut = "mouseout"

mouseEventKey MouseUp = "mouseup"

mouseEventKey MouseDown = "mousedown"

mouseEventKey Click = "click"

mouseEventKey DblClick = "dblclick"

-- | Subscribe to a mouse event by name.
foreign import onMouseEventJS ::
  forall e.
  String ->
  MouseEventTarget ->
  (MouseEvent -> Effect Unit) ->
  Effect MouseEventHandle

-- | Unsubscribe from a mouse event by name.
foreign import offMouseEventJS ::
  forall e.
  String ->
  MouseEventTarget ->
  MouseEventHandle ->
  Effect Unit

onMouseEvent ::
  forall e.
  MouseEventType ->
  MouseEventTarget ->
  (MouseEvent -> Effect Unit) ->
  Effect MouseEventHandle
onMouseEvent = onMouseEventJS <<< mouseEventKey

offMouseEvent ::
  forall e.
  MouseEventType ->
  MouseEventTarget ->
  MouseEventHandle ->
  Effect Unit
offMouseEvent = offMouseEventJS <<< mouseEventKey
