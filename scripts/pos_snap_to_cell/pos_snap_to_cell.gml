function pos_snap_to_cell(_pos, _cell_size) {
	return _cell_size/2+floor(_pos / _cell_size) * _cell_size;
}