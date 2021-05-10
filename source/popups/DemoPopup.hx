package popups;

import flixel.addons.ui.FlxUIPopup;
import openfl.system.System;

class DemoPopup extends FlxUIPopup {
	override public function create():Void {
		_xml_id = "soon_popup";
		super.create();
		_ui.setMode("demo_0");
	}

	override public function getEvent(id:String, target:Dynamic, data:Dynamic, ?params:Array<Dynamic>):Void {
		if (params != null && params.length > 0) {
			if (id == "click_button") {
				var i:Int = cast params[0];
				if (_ui.currMode == "demo_0") {
					switch (i) {
						case 0:
							_ui.setMode("demo_1");
						case 1:
							System.exit(0);
					}
				} else if (_ui.currMode == "demo_1") {
					switch (i) {
						case 0:
							_ui.setMode("demo_0");
						case 1:
							close();
					}
				}
			}
		}
	}
}
