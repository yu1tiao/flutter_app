package com.example.flutter_app

import android.os.Bundle
import android.widget.Toast
import io.flutter.app.FlutterPluginRegistry
import io.flutter.embedding.android.FlutterActivity
import io.flutter.plugin.common.MethodChannel
import io.flutter.view.FlutterNativeView

class MainActivity : FlutterActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        // 注册方法通道
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

        // 注册原生view工厂
//        FlutterPluginRegistry(FlutterNativeView(this), this)
//                .registrarFor("samples.yu/native_views")
//                .let {
//                    it.platformViewRegistry()
//                            .registerViewFactory("test_platform_view", SimpleViewFactory(it.messenger()))
//                }

    }
}
