enum ViewAnchorVertical { TOP, CENTER, BOTTOM }
enum ViewAnchorHorizontal { LEFT, CENTER, RIGHT }
function ViewAnchor(_x, _y, _halign, _valign) constructor {
    x = _x;
    y = _y;
    halign = _halign;
    valign = _valign;

    static set_position = function(_width, _height, _point) {

        // Horizontal alignment
        switch (halign) {
            case ViewAnchorHorizontal.LEFT:
                _point.x = x;
                break;
            case ViewAnchorHorizontal.CENTER:
                _point.x = x - _width / 2;
                break;
            case ViewAnchorHorizontal.RIGHT:
                _point.x = x - _width;
                break;
        }

        // Vertical alignment
        switch (valign) {
            case ViewAnchorVertical.TOP:
                _point.y = y;
                break;
            case ViewAnchorVertical.CENTER:
                _point.x = y - _height / 2;
                break;
            case ViewAnchorVertical.BOTTOM:
                _point.x = y - _height;
                break;
        }
    }
}