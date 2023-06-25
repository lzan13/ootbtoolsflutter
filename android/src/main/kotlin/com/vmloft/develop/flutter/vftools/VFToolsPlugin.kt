package com.vmloft.develop.flutter.vftools

import androidx.annotation.NonNull

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

/** VFToolsPlugin */
class VFToolsPlugin : FlutterPlugin, MethodCallHandler {
    /// 与 Flutter 层通讯的 Channel
    private lateinit var channel: MethodChannel

    /// 引擎绑定触发，实例化 Channel
    override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        channel = MethodChannel(flutterPluginBinding.binaryMessenger, "vftools")
        channel.setMethodCallHandler(this)
    }

    /**
     * Native -> Flutter 无返回值调用
     *
     * @param method 方法名
     * @param params 参数
     */
    fun invokeMethod(method: String, params: Any) {
        invokeMethod(method, params, null);
    }

    /**
     * Native -> Flutter 有返回值调用
     *
     * @param method 方法名
     * @param params 参数
     * @param result 返回数据
     */
    fun invokeMethod(method: String, params: Any, result: Result?) {
        if (channel != null) {
            if (result == null) {
                channel.invokeMethod(method, params);
            } else {
                channel.invokeMethod(method, params, result);
            }
        }
    }

    /// 通道触发相应方法
    override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
        when(call.method){
            "callNative"->callNative(call, result)
            else-> result.notImplemented()
        }
    }

    /**
     * Flutter -> Native 通用处理
     */
    fun callNative(call: MethodCall, result: Result) {
        val args: Map<String, Any> = call.arguments as Map<String, Any>

        val key = args.get("methodKey") as String
        when(key){
            "test"->result.success("test success")
            "getPlatformVersion"->result.success("Android ${android.os.Build.VERSION.RELEASE}")
            else-> result.notImplemented()
        }
    }

    /// 引擎解绑触发，注销 Channel
    override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }
}
