package com.softkall.cicoffee

import android.os.Bundle
import io.flutter.embedding.android.FlutterActivity
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity: FlutterActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        flutterEngine
                ?.let { engine -> GeneratedPluginRegistrant.registerWith(engine) }
    }
}
