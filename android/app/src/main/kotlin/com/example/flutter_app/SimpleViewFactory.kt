package com.example.flutter_app

import android.content.Context
import android.graphics.Color
import android.view.Gravity
import android.view.View
import android.view.ViewGroup
import android.widget.TextView
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.StandardMessageCodec
import io.flutter.plugin.platform.PlatformView
import io.flutter.plugin.platform.PlatformViewFactory

class SimpleViewFactory(private val messenger: BinaryMessenger) : PlatformViewFactory(StandardMessageCodec.INSTANCE) {
    override fun create(context: Context, viewId: Int, args: Any?): PlatformView {
        return SimpleViewControl(context, viewId, messenger)
    }
}

class SimpleViewControl(val context: Context, val id: Int, val messenger: BinaryMessenger) : PlatformView {

    private val view: View

    init {
        // 创建Android原生的view
        view = TextView(context).apply {
            layoutParams = ViewGroup.LayoutParams(100, 100)
            text = "这是Android原生的TextView"
            gravity = Gravity.CENTER
            setBackgroundColor(Color.YELLOW)
        }
    }

    override fun getView(): View {
        return view
    }

    override fun dispose() {
        // 销毁原生视图回调
    }
}