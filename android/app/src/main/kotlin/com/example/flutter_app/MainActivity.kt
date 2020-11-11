package com.example.flutter_app

import android.os.Bundle
import android.widget.Toast
import io.flutter.embedding.android.FlutterActivity
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        MethodChannel(flutterEngine!!.dartExecutor, "com.yu1tiao.test.toast").apply {
            setMethodCallHandler { call, result ->
                when (call.method) {
                    "nativeToast" -> {
                        Toast.makeText(applicationContext, call.arguments.toString(), Toast.LENGTH_SHORT).show()
                        result.success(0)
                    }
                    else -> {
                        result.notImplemented()
                    }
                }
            }
        }
    }
}
