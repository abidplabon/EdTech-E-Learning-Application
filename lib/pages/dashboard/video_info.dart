import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import "colors.dart" as color;
import 'colors.dart';
import 'congrats.dart';
class VideoInfo extends StatefulWidget {
  const VideoInfo({Key? key}) : super(key: key);



  @override
  _VideoInfoState createState() => _VideoInfoState();
}

class _VideoInfoState extends State<VideoInfo> {
  List videoInfo=[];
  bool _playArea = false;
  bool _isPlaying = false;
  bool _disposed = false;
  int _isPlayingIndex = -1;
  VideoPlayerController? _controller;
  String id ="0";

  _initData() async {
    //final arguments = ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    //final id = arguments["id"];
    //print(id);
    //print (id);
    await DefaultAssetBundle.of(context).loadString("json/videoinfo.json").then((value){
      setState(() {
        videoInfo= json.decode(value);
         //var x = videoInfo.where((element) => element["id"].toString()==id).toList();
        //videoInfo=x;
        //print(x);
      });
    });
  }


  @override
  void initState(){
    super.initState();
    _initData();
    //_onTapVideo(-1);
  }

  @override
  void dispose(){
    _disposed = true;
    _controller?.pause();
    _controller?.dispose();
    _controller = null;
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          decoration: _playArea==false?BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  color.AppColor.gradientFirst.withOpacity(0.9),
                  color.AppColor.gradientSecond
                ],
                begin: const FractionalOffset(0.0, 0.4),
                end: Alignment.topRight,
              )
          ):BoxDecoration(color: color.AppColor.gradientSecond),
          child: Column(
            children: [
              _playArea==false?Container(
                  padding: const EdgeInsets.only(top:70, left: 30, right: 30),
                  width: MediaQuery.of(context).size.width,
                  height: 300,
                  child:Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          InkWell(
                            onTap:(){
                              Navigator.pop(context);
                            },
                            child: Icon(Icons.arrow_back_ios, size: 20,
                                color:color.AppColor.secondPageIconColor),
                          ),

                        ],
                      ),
                      const SizedBox(height: 30,),

                      Row(
                        children: [
                          Container(
                            width: 90,
                            height: 30,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                gradient: LinearGradient(
                                  colors: [
                                    color.AppColor.secondPageContainerGradient1stColor,
                                    color.AppColor.secondPageContainerGradient2ndColor
                                  ],
                                  begin: Alignment.bottomLeft,
                                  end: Alignment.topRight,
                                )
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.timer,
                                  size: 20,
                                  color:color.AppColor.secondPageIconColor,),
                                const SizedBox(width: 5,),
                                Text(
                                  "",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color:color.AppColor.secondPageIconColor
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),

                    ],
                  )
              ):Container(
                child: Column(
                  children: [
                    Container(
                      height: 100,
                      padding: const EdgeInsets.only(top: 50,left: 30,right: 30),
                      child: Row(
                        children: [
                          InkWell(
                            onTap: (){

                            },
                            child: Icon(Icons.arrow_back_ios,
                              size: 20,
                              color: color.AppColor.secondPageIconColor,
                            ),
                          )
                        ],
                      ),
                    ),
                    _playView(context),
                    _controllView(context)
                  ],
                ),
              ),
              Expanded(child: Container(
                decoration: const BoxDecoration(
                    color:Colors.white,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(70)
                    )
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 30,),
                    Row(
                      children: [
                        const SizedBox(width: 30,),
                        Text(
                          "VLC Media Player",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color:color.AppColor.circuitsColor
                          ),
                        ),
                        Expanded(child: Container()),
                      ],
                    ),
                    const SizedBox(height: 20,),
                    Expanded(child: ListView.builder(
                        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
                        itemCount: videoInfo.length,
                        itemBuilder: (_,int index){
                          return GestureDetector(
                            onTap: (){
                              _onTapVideo(index);
                              debugPrint(index.toString());
                              setState(() {
                                if(_playArea==false){
                                  _playArea = true;
                                }
                              });
                            },
                            child: Container(
                              height: 135,
                              //color: Colors.redAccent,
                              width: 200,
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        width: 80,
                                        height: 80,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(18),
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    videoInfo[index]["thumbnail"]
                                                )
                                            )
                                        ),
                                      ),
                                      const SizedBox(width: 10,),
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            videoInfo[index]["title"],
                                            style: const TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold
                                            ),
                                          ),
                                          //const SizedBox(height: 5,),
                                          Padding(
                                            padding: const EdgeInsets.only(top: 20),
                                            child: Text(
                                              videoInfo[index]["time"],
                                              style: TextStyle(
                                                  color: Colors.grey[500]
                                              ),
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                  const SizedBox(height: 18,),
                                  Row(
                                    children: [
                                      Container(
                                        width: 80,
                                        height: 20,
                                        decoration: BoxDecoration(
                                            color: const Color(0xFFeaeefc),
                                            borderRadius: BorderRadius.circular(10)
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          for (int i=0; i<100; i++)
                                            i.isEven?Container(
                                              height: 1,
                                              width: 3,
                                              decoration: BoxDecoration(
                                                  color: const Color(0xFF839fed),
                                                  borderRadius: BorderRadius.circular(2)
                                              ),
                                            ):Container(
                                              height: 1,
                                              width: 3,
                                              color: Colors.white,
                                            )
                                        ],
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          );
                        }))
                  ],
                ),
              ))
            ],
          ),
        ));
  }
  String convertTwo(int value){
    return value<10?"0$value":"$value";
  }
  Widget _controllView(BuildContext context){
    final onMute = (_controller?.value?.volume??0)>0;
    final duration = _duration?.inSeconds??0;
    final head = _position?.inSeconds??0;
    final remained = max(0, duration - head);
    final mins = convertTwo(remained ~/ 60.0);
    final secs = convertTwo(remained % 60);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SliderTheme(
            data: SliderTheme.of(context).copyWith(
                activeTrackColor: Colors.red[700],
                inactiveTrackColor: Colors.red[100],
                trackShape: RoundedRectSliderTrackShape(),
                trackHeight: 2.0,
                thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12.0),
                thumbColor: Colors.redAccent,
                overlayColor: Colors.red.withAlpha(32),
                overlayShape: RoundSliderOverlayShape(overlayRadius: 28.0),
                tickMarkShape: RoundSliderTickMarkShape(),
                activeTickMarkColor: Colors.red[700],
                inactiveTickMarkColor: Colors.red[100],
                valueIndicatorShape: PaddleSliderValueIndicatorShape(),
                valueIndicatorColor: Colors.redAccent,
                valueIndicatorTextStyle: TextStyle(
                    color: Colors.white
                )
            ),
            child: Slider(
              value: max(0, min(_progress*100, 100)),
              min: 0,
              max: 100,
              divisions: 100,
              label: _position?.toString().split(".")[0],
              onChanged: (value){
                setState(() {
                  _progress = value*0.01;
                });
              },
              onChangeStart: (value){
                _controller?.pause();
              },
              onChangeEnd: (value){
                final duration = _controller?.value?.duration;
                if(duration!=null){
                  var newValue = max(0, min(value, 99))*0.01;
                  var millis = (duration.inMilliseconds*newValue).toInt();
                  _controller?.seekTo(Duration(milliseconds: millis));
                  _controller?.play();
                }
              },
            )),
        Container(
          height: 120,
          width: MediaQuery.of(context).size.width,
          color: AppColor.gradientSecond,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 8),
                  child: Container(
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(0.0,0.0),
                              blurRadius: 4.0,
                              color: Color.fromARGB(50, 0, 0, 0)
                          )
                        ]
                    ),
                    child: Icon(
                      onMute?Icons.volume_up:Icons.volume_off,
                      color: Colors.white,
                    ),
                  ),
                ),
                onTap: (){
                  if(onMute){
                    _controller?.setVolume(0);
                  }else{
                    _controller?.setVolume(1.0);
                  }
                  setState(() {

                  });
                },
              ),
              TextButton(
                  onPressed: () async{
                    final index = _isPlayingIndex-1;
                    if(index>=0&&videoInfo.length>=0){
                      _onTapVideo(index);
                    }else{
                      Get.snackbar("Video","No more video to play",
                          snackPosition: SnackPosition.BOTTOM,
                          icon: const Icon(Icons.face,
                            size: 30,
                            color: Colors.white,
                          ),
                          backgroundColor: AppColor.gradientSecond,
                          colorText: Colors.white
                      );
                    }
                  },
                  child: const Icon(
                    Icons.fast_rewind,
                    size: 36,
                    color: Colors.white,
                  )),
              TextButton(
                  onPressed: () async{
                    if(_isPlaying){
                      setState(() {
                        _isPlaying=false;
                      });
                      _controller?.pause();
                    }else{
                      setState(() {
                        _isPlaying=true;
                      });
                      _controller?.play();
                    }
                  },
                  child: Icon(
                    _isPlaying?Icons.pause:Icons.play_arrow,
                    size: 36,
                    color: Colors.white,
                  )),
              TextButton(
                  onPressed: () async{
                    final index = _isPlayingIndex+1;
                    if(index<=videoInfo.length-1){
                      _onTapVideo(index);
                    }else{
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CongratsPage(),
                        ),
                      );

                    }
                  },
                  child: const Icon(
                    Icons.fast_forward,
                    size: 36,
                    color: Colors.white,
                  )),
              Text("$mins:$secs",
                style: TextStyle(
                    color: Colors.white,
                    shadows: <Shadow>[
                      Shadow(
                          offset: Offset(0.0,1.0),
                          blurRadius: 4.0,
                          color: Color.fromARGB(150, 0, 0, 0)
                      )
                    ]
                ),
              )
            ],
          ),
        ),
      ],
    );
  }


  Widget _playView(BuildContext context){
    final controller = _controller;
    if(controller!=null&&controller.value.isInitialized){
      return AspectRatio(
        aspectRatio: 16/9,
        child: VideoPlayer(controller),
      );
    }else{
      return const AspectRatio(
        aspectRatio: 16/9,
        child: Center(
          child: Text("Preparing.......",
            style: TextStyle(
                fontSize: 20,
                color: Colors.white60
            ),
          ),
        ),
      );
    }
  }
  _onTapVideo(int index) async{
    final controller = VideoPlayerController.network(videoInfo[index]["videoUrl"]);
    final old = _controller;
    _controller = controller;
    if(old!=null){
      old.removeListener(_onControllerUpdate); //remember info
      old.pause(); //
    }
    setState(() {

    });
    controller..initialize().then((_){
      old?.dispose(); //if old one exist then remove it
      _isPlayingIndex = index;
      controller.addListener(_onControllerUpdate);
      controller.play();
      setState(() {

      });
    });
  }
  var _onUpdateControllerTime;
  Duration? _duration;
  Duration? _position;
  var _progress=0.0;
  void _onControllerUpdate() async{
    if(_disposed){
      return;
    }
    _onUpdateControllerTime=0;
    final now = DateTime.now().millisecondsSinceEpoch;
    if(_onUpdateControllerTime>now){
      return;
    }
    _onUpdateControllerTime=now+500;
    final controller = _controller;
    if(controller==null){
      debugPrint("controller is null");
      return;
    }
    if(!controller.value.isInitialized){
      debugPrint("Controller can not be initialized");
      return;
    }
    var duration = _duration;
    if(duration == null) return;

    var position = await controller.position;
    _position = position;
    final playing = controller.value.isPlaying;
    if(playing){
      if(_disposed)return;
      setState(() {
        //60 30 //30/60 = 0.5(Progress 0-0.9)
        _progress = position!.inMilliseconds.ceilToDouble()/duration.inMilliseconds.ceilToDouble();
      });
    }
    _isPlaying=playing;
  }
}