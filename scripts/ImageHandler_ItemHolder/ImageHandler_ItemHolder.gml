function ImageHandler_ItemHolder(_background_sprite, _background_padding, _item_sprite, _item_disposition, _item_spacing, _view_anchor) constructor {
    // Precompute item and background positions
    var _item_size = new Point2d(
        sprite_get_width(_item_sprite),
        sprite_get_height(_item_sprite)
    );

    var _background_size = new Point2d(
        (_item_size.x + _item_spacing.x) * _item_disposition.x - _item_spacing.x + _background_padding.x *2,
        (_item_size.y + _item_spacing.y) * _item_disposition.y - _item_spacing.y + _background_padding.y *2
    );

    var _anchor_point = new Point2d();
	_view_anchor.set_position(_background_size.x, _background_size.y, _anchor_point);
    
    var _start_point = _anchor_point.Clone();
    _start_point.x += sprite_get_xoffset(_item_sprite);
    _start_point.y += sprite_get_yoffset(_item_sprite);

    item_pos = array_create(_item_disposition.x * _item_disposition.y);
    for (var _y = 0; _y < _item_disposition.y; _y++) {
    for (var _x = 0; _x < _item_disposition.x; _x++) {
        item_pos[_x + _item_disposition.x * _y] = new Point2d(
            _start_point.x + _x * (_item_size.x + _item_spacing.x),
            _start_point.y + _y * (_item_size.y + _item_spacing.y)
        );
    }}
    
    background = {
        draw_position: new Point2d(
            _anchor_point.x + sprite_get_xoffset(_background_sprite) * _background_size.x - _background_padding.x,
            _anchor_point.y + sprite_get_yoffset(_background_sprite) * _background_size.y - _background_padding.y
        ),
		draw_size: _background_size,
        draw_scale: new Point2d(
            (_background_size.x + _background_padding.x *2) / sprite_get_width(_background_sprite),
            (_background_size.y + _background_padding.y *2) / sprite_get_height(_background_sprite)
        )
    }
}
