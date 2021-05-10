package activities;

import activities.SplashLoadingActivity;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.tweens.FlxTween;
import flixel.util.FlxTimer;

class SplashActivity extends FlxState {
	private var splashState = "";

	var splashTimer = new FlxTimer();

	var splashLogoFadeLength:Float = 0.65;
	var splashWaitLength:Float = 5;
	var splashTransitionLength:Float = 1;

	// Bitmaps and Text
	var logoBitmap = new FlxSprite();
	var noticeText = new flixel.text.FlxText(0, 0, 200, "A capstone project for UPHS-GMA Senior High School Department.", 36);

	override public function create():Void {
		super.create();
		tnsLogo();
	}

	override public function update(elapsed:Float) {
		if (FlxG.mouse.justPressed) {
			if (splashState == "tns") {
				splashTimer.cancel();
				logoBitmap.alpha = 0;
				uphslLogo();
			} else if (splashState == "uphsl") {
				splashTimer.cancel();
				logoBitmap.alpha = 0;
				remove(logoBitmap);
				noticeLine();
			} else if (splashState == "text") {
				splashTimer.cancel();
				noticeText.alpha = 0;
				splashTransition();
			}
		}

		super.update(elapsed);
	}

	// TNS Logo - TenSeventy7
	private function tnsLogo() {
		logoBitmap.loadGraphic("assets/images/splash/tns_sw.png", false);
		logoBitmap.scale.set(0.075, 0.075);
		logoBitmap.setGraphicSize();
		logoBitmap.antialiasing = true;
		logoBitmap.screenCenter();
		logoBitmap.alpha = 0;

		add(logoBitmap);

		FlxTween.tween(logoBitmap, {alpha: 0.3}, splashLogoFadeLength, {
			startDelay: 1
		}).start();

		FlxG.sound.cache(AssetPaths.game_bgm_primary__ogg);
		splashState = "tns";

		splashTimer.start(splashWaitLength, function(tmr:FlxTimer) {
			FlxTween.tween(logoBitmap, {alpha: 0}, splashLogoFadeLength).start();
			new FlxTimer().start(2, function(tmr:FlxTimer) {
				uphslLogo();
			});
		});
	}

	// UPHSL Logo - Uni Requirement
	private function uphslLogo() {
		splashState = "uphsl";

		logoBitmap.loadGraphic("assets/images/splash/uphsl.png", false);
		logoBitmap.scale.set(0.4, 0.4);
		logoBitmap.setGraphicSize();
		logoBitmap.antialiasing = true;
		logoBitmap.screenCenter();
		logoBitmap.alpha = 0;

		FlxTween.tween(logoBitmap, {alpha: 1}, splashLogoFadeLength).start();

		splashTimer.start(splashWaitLength, function(tmr:FlxTimer) {
			FlxTween.tween(logoBitmap, {alpha: 0}, splashLogoFadeLength).start();
			new FlxTimer().start(2, function(tmr:FlxTimer) {
				remove(logoBitmap);
				noticeLine();
			});
		});
	}

	// Notice Text - for the group <3
	private function noticeLine() {
		splashState = "text";

		noticeText.setFormat("assets/fonts/Kenney-Mini.ttf", 16, 0xFF353535);
		noticeText.alpha = 0;
		noticeText.wordWrap = true;
		noticeText.antialiasing = true;
		noticeText.screenCenter();
		noticeText.alignment = "center";
		add(noticeText);

		FlxTween.tween(noticeText, {alpha: 1}, splashLogoFadeLength).start();

		splashTimer.start(splashWaitLength, function(tmr:FlxTimer) {
			FlxTween.tween(noticeText, {alpha: 0}, splashLogoFadeLength).start();
			new FlxTimer().start(2, function(tmr:FlxTimer) {
				splashTransition();
			});
		});
	}

	private function splashTransition() {
		splashState = "done";

		new FlxTimer().start(splashTransitionLength, function(tmr:FlxTimer) {
			FlxG.switchState(new SplashLoadingActivity());
		});
	}
}
