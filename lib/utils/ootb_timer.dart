import 'dart:async';

/// 倒计时回调
///  callback.(millisUntilFinished 毫秒).
typedef void OnTimerCallback(int millisUntilFinished);

/// author: lzan13
/// date: 2023/08/31
/// github: https://github.com/lzan13
///
/// 倒计时工具类
class OTTimer {
  /// Timer.
  Timer? _mTimer;

  /// Timer是否启动.
  bool _isActive = false;

  /// Timer间隔 单位毫秒，默认1000毫秒(1秒).
  int mInterval = 1000;

  /// 倒计时总时间
  int mTotalTime = 1000 * 60; //单位毫秒

  late OnTimerCallback _onTimerCallback;

  // OTTimer(Key? key, this.mInterval, this.mTotalTime);

  /// 设置Timer间隔.
  void setInterval(int interval) {
    if (interval <= 0) interval = Duration.millisecondsPerSecond;
    mInterval = interval;
  }

  /// 设置倒计时总时间.
  void setTotalTime(int totalTime) {
    if (totalTime <= 0) return;
    mTotalTime = totalTime;
  }

  /// 启动定时Timer.
  void startTimer() {
    if (_isActive || mInterval <= 0) return;
    _isActive = true;
    Duration duration = Duration(milliseconds: mInterval);
    _doCallback(0);
    _mTimer = Timer.periodic(duration, (Timer timer) {
      _doCallback(timer.tick);
    });
  }

  /// 启动倒计时Timer.
  void startCountDown() {
    if (_isActive || mInterval <= 0 || mTotalTime <= 0) return;
    _isActive = true;
    Duration duration = Duration(milliseconds: mInterval);
    _doCallback(mTotalTime);
    _mTimer = Timer.periodic(duration, (Timer timer) {
      int time = mTotalTime - mInterval;
      mTotalTime = time;
      if (time >= mInterval) {
        _doCallback(time);
      } else if (time == 0) {
        _doCallback(time);
        cancel();
      } else {
        timer.cancel();
        Future.delayed(Duration(milliseconds: time), () {
          mTotalTime = 0;
          _doCallback(0);
          cancel();
        });
      }
    });
  }

  void _doCallback(int time) {
    _onTimerCallback(time);
  }

  /// 重设倒计时总时间.
  void updateTotalTime(int totalTime) {
    cancel();
    mTotalTime = totalTime;
    startCountDown();
  }

  /// Timer是否启动.
  bool isActive() {
    return _isActive;
  }

  /// 取消计时器.
  void cancel() {
    if (_mTimer != null) {
      _mTimer?.cancel();
      _mTimer = null;
    }
    _isActive = false;
  }

  /// 设置计时器回调
  void setOnTimerCallback(OnTimerCallback callback) {
    _onTimerCallback = callback;
  }
}
