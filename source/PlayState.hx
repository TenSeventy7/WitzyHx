package;

import flixel.FlxState;

class PlayState extends FlxState {
	override public function create() {
		super.create();

		var text = new flixel.text.FlxText(0, 0, 0, "Hello Android", 40);
		text.screenCenter();
		add(text);
	}

	override public function update(elapsed:Float) {
		super.update(elapsed);
	}
}
