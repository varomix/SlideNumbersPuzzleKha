package;

import kha.System;

class Main {
	public static function main() {
		System.init({title: "Slide Numbers Puzzle", width: 768, height: 1280}, function () {
			new Puzzle();
		});
	}
}
