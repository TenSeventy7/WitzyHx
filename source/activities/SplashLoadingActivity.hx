package activities;

import flixel.FlxG;
import flixel.addons.ui.FlxUIState;
import popups.DemoPopup;

class SplashLoadingActivity extends FlxUIState {
	static var initialized:Bool = false;

	override public function create():Void {
		FlxG.cameras.bgColor = 0xff032B43;
		super.create();
		FlxG.sound.playMusic(AssetPaths.game_bgm_primary__ogg, 0);
		FlxG.sound.music.fadeIn(3, 0, 0.7);
		openSubState(new DemoPopup());
	}

	override public function update(elapsed:Float) {
		super.update(elapsed);
	}
}
