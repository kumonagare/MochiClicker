import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'achievement_data.g.dart';

@Collection()
class AchievementModel {
  Id id = Isar.autoIncrement;
  late String title;
  late String subTitle;
  late String imagePath;
  late bool shouldShowImage;
}

class AchievementData extends ChangeNotifier {
  // シングルトンによるインスタンスの単一化
  static final AchievementData _instance = AchievementData._internal();
  factory AchievementData() => _instance;
  AchievementData._internal();

  // Isarのデータを格納するリスト
  List<AchievementModel> _achievementData = [];
  List<AchievementModel> get achievementData => _achievementData;
  List<int> ids = List.generate(190, (index) => index + 1);
  late Isar _isar;

  // 初期化
  Future<void> initIsar() async {
    final prefs = await SharedPreferences.getInstance();
    final isFirstTimeAchievement =
        prefs.getBool('isFirstTimeAchievement') ?? true;
    final dir = await getApplicationDocumentsDirectory();
    _isar = await Isar.open(
      [AchievementModelSchema],
      name: 'AchievementModelDB',
      inspector: true,
      directory: dir.path,
    );

    // 初回起動時の動作
    if (isFirstTimeAchievement) {
      await onlyOnce();
      await prefs.setBool('isFirstTimeUpgrade', false);
    }

    // DBからデータ取得
    _achievementData = (await _isar.achievementModels.getAll(ids))
        .where((item) => item != null)
        .map((item) => item!)
        .toList();
    notifyListeners();
  }

  Future<void> onlyOnce() async {
    List<AchievementModel> items = [];
    items.add(AchievementModel()
      ..title = 'Iron Clicker'
      ..subTitle = '鉄のクリッカーを獲得した\n初めの一歩だ'
      ..imagePath = 'assets/images/back.png'
      ..shouldShowImage = false);

    items.add(AchievementModel()
      ..title = 'Bronze Clicker'
      ..subTitle = '銅のクリッカーを獲得した\n大仏の素材'
      ..imagePath = 'assets/images/back.png'
      ..shouldShowImage = false);

    items.add(AchievementModel()
      ..title = 'Silver Clicker'
      ..subTitle = '銀のクリッカーを獲得した\nかっちょいい'
      ..imagePath = 'assets/images/back.png'
      ..shouldShowImage = false);

    items.add(AchievementModel()
      ..title = 'Gold Clicker'
      ..subTitle = '金のクリッカーを獲得した\n値上がりするかも'
      ..imagePath = 'assets/images/back.png'
      ..shouldShowImage = false);

    items.add(AchievementModel()
      ..title = 'Platinum Clicker'
      ..subTitle = 'プラチナのクリッカーを獲得した\n本物です'
      ..imagePath = 'assets/images/back.png'
      ..shouldShowImage = false);

    items.add(AchievementModel()
      ..title = 'Diamond Clicker'
      ..subTitle = 'ダイヤのクリッカーを獲得した\nきれ～い!!'
      ..imagePath = 'assets/images/back.png'
      ..shouldShowImage = false);

    items.add(AchievementModel()
      ..title = 'Master Clicker'
      ..subTitle = 'マスターのクリッカーを獲得した\nお前に教えることは、もうない。'
      ..imagePath = 'assets/images/back.png'
      ..shouldShowImage = false);

    items.add(AchievementModel()
      ..title = 'Devil Clicker'
      ..subTitle = '悪魔のクリッカーを獲得した\nきょわい!!!!'
      ..imagePath = 'assets/images/back.png'
      ..shouldShowImage = false);

    items.add(AchievementModel()
      ..title = 'Angel Clicker'
      ..subTitle = '天使のクリッカーを獲得した\n善い行いをしましたね'
      ..imagePath = 'assets/images/back.png'
      ..shouldShowImage = false);

    items.add(AchievementModel()
      ..title = 'God Clicker'
      ..subTitle = '神のクリッカーを獲得した\n全知全能です'
      ..imagePath = 'assets/images/back.png'
      ..shouldShowImage = false);

    // -----------------------ここからHandmade---------------------------
    items.add(AchievementModel()
      ..title = 'Iron Handmade'
      ..subTitle = '鉄の手作り餅を獲得した\n何キロかな'
      ..imagePath = 'assets/images/back.png'
      ..shouldShowImage = false);

    items.add(AchievementModel()
      ..title = 'Bronze Handmade'
      ..subTitle = '銅の手作り餅を獲得した\n食べないでね'
      ..imagePath = 'assets/images/back.png'
      ..shouldShowImage = false);

    items.add(AchievementModel()
      ..title = 'Silver Handmade'
      ..subTitle = '銀の手作り餅を獲得した\n銀ピカ'
      ..imagePath = 'assets/images/back.png'
      ..shouldShowImage = false);

    items.add(AchievementModel()
      ..title = 'Gold Handmade'
      ..subTitle = '金の手作り餅を獲得した\n小金持ちだね、餅だけに'
      ..imagePath = 'assets/images/back.png'
      ..shouldShowImage = false);

    items.add(AchievementModel()
      ..title = 'Platinum Handmade'
      ..subTitle = 'プラチナの手作り餅を獲得した\nおしゃだ'
      ..imagePath = 'assets/images/back.png'
      ..shouldShowImage = false);

    items.add(AchievementModel()
      ..title = 'Diamond Handmade'
      ..subTitle = 'ダイヤの手作り餅を獲得した\nブリリアント!!!'
      ..imagePath = 'assets/images/back.png'
      ..shouldShowImage = false);

    items.add(AchievementModel()
      ..title = 'Master Handmade'
      ..subTitle = 'マスターの手作り餅を獲得した\nマスターハンドです'
      ..imagePath = 'assets/images/back.png'
      ..shouldShowImage = false);

    items.add(AchievementModel()
      ..title = 'Devil Handmade'
      ..subTitle = '悪魔の手作り餅を獲得した\n中に何が入ってるの?'
      ..imagePath = 'assets/images/back.png'
      ..shouldShowImage = false);

    items.add(AchievementModel()
      ..title = 'Angel Handmade'
      ..subTitle = '天使の手作り餅を獲得した\nやさしい...'
      ..imagePath = 'assets/images/back.png'
      ..shouldShowImage = false);

    items.add(AchievementModel()
      ..title = 'God Handmade'
      ..subTitle = '神の手作り餅を獲得した\nほとばしる光...!'
      ..imagePath = 'assets/images/back.png'
      ..shouldShowImage = false);

    // -----------------------ここからMochiMachine---------------------------
    items.add(AchievementModel()
      ..title = 'Iron MochiMachine'
      ..subTitle = '鉄の餅つき機を獲得した\n普通のやつ'
      ..imagePath = 'assets/images/back.png'
      ..shouldShowImage = false);

    items.add(AchievementModel()
      ..title = 'Bronze MochiMachine'
      ..subTitle = '銅の餅つき機を獲得した\n銅窯みたいな感じ?'
      ..imagePath = 'assets/images/back.png'
      ..shouldShowImage = false);

    items.add(AchievementModel()
      ..title = 'Silver MochiMachine'
      ..subTitle = '銀の餅つき機を獲得した\nあなたが落としたのは...'
      ..imagePath = 'assets/images/back.png'
      ..shouldShowImage = false);

    items.add(AchievementModel()
      ..title = 'Gold MochiMachine'
      ..subTitle = '金の餅つき機を獲得した\nこっちを落としました!!!!'
      ..imagePath = 'assets/images/back.png'
      ..shouldShowImage = false);

    items.add(AchievementModel()
      ..title = 'Platinum MochiMachine'
      ..subTitle = 'プラチナの餅つき機を獲得した\n嘘つきには何もあげません!!'
      ..imagePath = 'assets/images/back.png'
      ..shouldShowImage = false);

    items.add(AchievementModel()
      ..title = 'Diamond MochiMachine'
      ..subTitle = 'ダイヤの餅つき機を獲得した\nすぐ壊れます。'
      ..imagePath = 'assets/images/back.png'
      ..shouldShowImage = false);

    items.add(AchievementModel()
      ..title = 'Master MochiMachine'
      ..subTitle = 'マスターの餅つき機を獲得した\nあるよぉ'
      ..imagePath = 'assets/images/back.png'
      ..shouldShowImage = false);

    items.add(AchievementModel()
      ..title = 'Devil MochiMachine'
      ..subTitle = '悪魔の餅つき機を獲得した\nお前も餅にしてやろうか～!'
      ..imagePath = 'assets/images/back.png'
      ..shouldShowImage = false);

    items.add(AchievementModel()
      ..title = 'Angel MochiMachine'
      ..subTitle = '天使の餅つき機を獲得した\n飛んでっちゃった...'
      ..imagePath = 'assets/images/back.png'
      ..shouldShowImage = false);

    items.add(AchievementModel()
      ..title = 'God MochiMachine'
      ..subTitle = '神の餅つき機を獲得した\n神器。'
      ..imagePath = 'assets/images/back.png'
      ..shouldShowImage = false);

    // -----------------------ここからMochiya---------------------------
    items.add(AchievementModel()
      ..title = 'Iron Mochiya'
      ..subTitle = '鉄の餅屋を獲得した\nカッチカチやで'
      ..imagePath = 'assets/images/back.png'
      ..shouldShowImage = false);

    items.add(AchievementModel()
      ..title = 'Bronze Mochiya'
      ..subTitle = '銅の餅屋を獲得した\nどうでしょう'
      ..imagePath = 'assets/images/back.png'
      ..shouldShowImage = false);

    items.add(AchievementModel()
      ..title = 'Silver Mochiya'
      ..subTitle = '銀の餅屋を獲得した\n割といい餅屋'
      ..imagePath = 'assets/images/back.png'
      ..shouldShowImage = false);

    items.add(AchievementModel()
      ..title = 'Gold Mochiya'
      ..subTitle = '金の餅屋を獲得した\nイカすぜ'
      ..imagePath = 'assets/images/back.png'
      ..shouldShowImage = false);

    items.add(AchievementModel()
      ..title = 'Platinum Mochiya'
      ..subTitle = 'プラチナの餅屋を獲得した\n最高!'
      ..imagePath = 'assets/images/back.png'
      ..shouldShowImage = false);

    items.add(AchievementModel()
      ..title = 'Diamond Mochiya'
      ..subTitle = 'ダイヤの餅屋を獲得した\n清潔です'
      ..imagePath = 'assets/images/back.png'
      ..shouldShowImage = false);

    items.add(AchievementModel()
      ..title = 'Master Mochiya'
      ..subTitle = 'マスターの餅屋を獲得した\n達人が住まう餅屋'
      ..imagePath = 'assets/images/back.png'
      ..shouldShowImage = false);

    items.add(AchievementModel()
      ..title = 'Devil Mochiya'
      ..subTitle = '悪魔の餅屋を獲得した\n悪魔も餅が欲しい'
      ..imagePath = 'assets/images/back.png'
      ..shouldShowImage = false);

    items.add(AchievementModel()
      ..title = 'Angel Mochiya'
      ..subTitle = '天使の餅屋を獲得した\n天から降ってくるかも'
      ..imagePath = 'assets/images/back.png'
      ..shouldShowImage = false);

    items.add(AchievementModel()
      ..title = 'God Mochiya'
      ..subTitle = '神の餅屋を獲得した\n神聖だぁ'
      ..imagePath = 'assets/images/back.png'
      ..shouldShowImage = false);

    // -----------------------ここからMochiFactory---------------------------
    items.add(AchievementModel()
      ..title = 'Iron MochiFactory'
      ..subTitle = '鉄の餅工場を獲得した\n加工してます'
      ..imagePath = 'assets/images/back.png'
      ..shouldShowImage = false);

    items.add(AchievementModel()
      ..title = 'Bronze MochiFactory'
      ..subTitle = '銅の餅工場を獲得した\nなんか臭い...'
      ..imagePath = 'assets/images/back.png'
      ..shouldShowImage = false);

    items.add(AchievementModel()
      ..title = 'Silver MochiFactory'
      ..subTitle = '銀の餅工場を獲得した\nまぶしい...!'
      ..imagePath = 'assets/images/back.png'
      ..shouldShowImage = false);

    items.add(AchievementModel()
      ..title = 'Gold MochiFactory'
      ..subTitle = '金の餅工場を獲得した\nゴージャス!マダガスカル!!'
      ..imagePath = 'assets/images/back.png'
      ..shouldShowImage = false);

    items.add(AchievementModel()
      ..title = 'Platinum MochiFactory'
      ..subTitle = 'プラチナの餅工場を獲得した\nそんなに使ってええんか?'
      ..imagePath = 'assets/images/back.png'
      ..shouldShowImage = false);

    items.add(AchievementModel()
      ..title = 'Diamond MochiFactory'
      ..subTitle = 'ダイヤの餅工場を獲得した\n私、気になります!!!!'
      ..imagePath = 'assets/images/back.png'
      ..shouldShowImage = false);

    items.add(AchievementModel()
      ..title = 'Master MochiFactory'
      ..subTitle = 'マスターの餅工場を獲得した\nとにかくすごい'
      ..imagePath = 'assets/images/back.png'
      ..shouldShowImage = false);

    items.add(AchievementModel()
      ..title = 'Devil MochiFactory'
      ..subTitle = '悪魔の餅工場を獲得した\n何を作ってるんですか?'
      ..imagePath = 'assets/images/back.png'
      ..shouldShowImage = false);

    items.add(AchievementModel()
      ..title = 'Angel MochiFactory'
      ..subTitle = '天使の餅工場を獲得した\nなんか、ウケるw'
      ..imagePath = 'assets/images/back.png'
      ..shouldShowImage = false);

    items.add(AchievementModel()
      ..title = 'God MochiFactory'
      ..subTitle = '神の餅工場を獲得した\nちょっと待てぃ!'
      ..imagePath = 'assets/images/back.png'
      ..shouldShowImage = false);

    // -----------------------ここからMochiMaster---------------------------
    items.add(AchievementModel()
      ..title = 'Iron MochiMaster'
      ..subTitle = '鉄の餅名人を獲得した\nまさに鉄人!'
      ..imagePath = 'assets/images/back.png'
      ..shouldShowImage = false);

    items.add(AchievementModel()
      ..title = 'Bronze MochiMaster'
      ..subTitle = '銅の餅名人を獲得した\n胡散臭い。'
      ..imagePath = 'assets/images/back.png'
      ..shouldShowImage = false);

    items.add(AchievementModel()
      ..title = 'Silver MochiMaster'
      ..subTitle = '銀の餅名人を獲得した\nホントに名人ですかぁ?'
      ..imagePath = 'assets/images/back.png'
      ..shouldShowImage = false);

    items.add(AchievementModel()
      ..title = 'Gold MochiMaster'
      ..subTitle = '金の餅名人を獲得した\n金賞受賞。'
      ..imagePath = 'assets/images/back.png'
      ..shouldShowImage = false);

    items.add(AchievementModel()
      ..title = 'Platinum MochiMaster'
      ..subTitle = 'プラチナの餅名人を獲得した\nどんな名人やねん'
      ..imagePath = 'assets/images/back.png'
      ..shouldShowImage = false);

    items.add(AchievementModel()
      ..title = 'Diamond MochiMaster'
      ..subTitle = 'ダイヤの餅名人を獲得した\n転職した方がいい。'
      ..imagePath = 'assets/images/back.png'
      ..shouldShowImage = false);

    items.add(AchievementModel()
      ..title = 'Master MochiMaster'
      ..subTitle = 'マスターの餅名人を獲得した\nまぁ名人の中の名人ちゅうやつや'
      ..imagePath = 'assets/images/back.png'
      ..shouldShowImage = false);

    items.add(AchievementModel()
      ..title = 'Devil MochiMaster'
      ..subTitle = '悪魔の餅名人を獲得した\nやられる...!'
      ..imagePath = 'assets/images/back.png'
      ..shouldShowImage = false);

    items.add(AchievementModel()
      ..title = 'Angel MochiMaster'
      ..subTitle = '天使の餅名人を獲得した\n弟子にしてくれ!!!'
      ..imagePath = 'assets/images/back.png'
      ..shouldShowImage = false);

    items.add(AchievementModel()
      ..title = 'God MochiMaster'
      ..subTitle = '神の餅名人を獲得した\n世界にただ一人!!!'
      ..imagePath = 'assets/images/back.png'
      ..shouldShowImage = false);

    // -----------------------ここからMochiRuin---------------------------
    items.add(AchievementModel()
      ..title = 'Iron MochiRuin'
      ..subTitle = '鉄の餅遺跡を獲得した\n古代人すごい'
      ..imagePath = 'assets/images/back.png'
      ..shouldShowImage = false);

    items.add(AchievementModel()
      ..title = 'Bronze MochiRuin'
      ..subTitle = '銅の餅遺跡を獲得した\nそうそう、これこれ'
      ..imagePath = 'assets/images/back.png'
      ..shouldShowImage = false);

    items.add(AchievementModel()
      ..title = 'Silver MochiRuin'
      ..subTitle = '銀の餅遺跡を獲得した\n持って帰りたい'
      ..imagePath = 'assets/images/back.png'
      ..shouldShowImage = false);

    items.add(AchievementModel()
      ..title = 'Gold MochiRuin'
      ..subTitle = '金の餅遺跡を獲得した\n黄金卿は実在した'
      ..imagePath = 'assets/images/back.png'
      ..shouldShowImage = false);

    items.add(AchievementModel()
      ..title = 'Platinum MochiRuin'
      ..subTitle = 'プラチナの餅遺跡を獲得した\n意外と柔らかい'
      ..imagePath = 'assets/images/back.png'
      ..shouldShowImage = false);

    items.add(AchievementModel()
      ..title = 'Diamond MochiRuin'
      ..subTitle = 'ダイヤの餅遺跡を獲得した\n金持ちだ!!!!!!'
      ..imagePath = 'assets/images/back.png'
      ..shouldShowImage = false);

    items.add(AchievementModel()
      ..title = 'Master MochiRuin'
      ..subTitle = 'マスターの餅遺跡を獲得した\n秘伝の書があります'
      ..imagePath = 'assets/images/back.png'
      ..shouldShowImage = false);

    items.add(AchievementModel()
      ..title = 'Devil MochiRuin'
      ..subTitle = '悪魔の餅遺跡を獲得した\n趣味悪いよ'
      ..imagePath = 'assets/images/back.png'
      ..shouldShowImage = false);

    items.add(AchievementModel()
      ..title = 'Angel MochiRuin'
      ..subTitle = '天使の餅遺跡を獲得した\nメルへ～ン!'
      ..imagePath = 'assets/images/back.png'
      ..shouldShowImage = false);

    items.add(AchievementModel()
      ..title = 'God MochiRuin'
      ..subTitle = '神の餅遺跡を獲得した\n誰も見つけられません'
      ..imagePath = 'assets/images/back.png'
      ..shouldShowImage = false);

    // -----------------------ここからMochiFairy---------------------------
    items.add(AchievementModel()
      ..title = 'Iron MochiFairy'
      ..subTitle = '鉄の餅妖精を獲得した\n飛べません。'
      ..imagePath = 'assets/images/back.png'
      ..shouldShowImage = false);

    items.add(AchievementModel()
      ..title = 'Bronze MochiFairy'
      ..subTitle = '銅の餅妖精を獲得した\nまぁ、銅像みたいなもん'
      ..imagePath = 'assets/images/back.png'
      ..shouldShowImage = false);

    items.add(AchievementModel()
      ..title = 'Silver MochiFairy'
      ..subTitle = '銀の餅妖精を獲得した\n格が高い'
      ..imagePath = 'assets/images/back.png'
      ..shouldShowImage = false);

    items.add(AchievementModel()
      ..title = 'Gold MochiFairy'
      ..subTitle = '金の餅妖精を獲得した\nダウジングに使おう'
      ..imagePath = 'assets/images/back.png'
      ..shouldShowImage = false);

    items.add(AchievementModel()
      ..title = 'Platinum MochiFairy'
      ..subTitle = 'プラチナの餅妖精を獲得した\n飾りです'
      ..imagePath = 'assets/images/back.png'
      ..shouldShowImage = false);

    items.add(AchievementModel()
      ..title = 'Diamond MochiFairy'
      ..subTitle = 'ダイヤの餅妖精を獲得した\nいっぱいほしい'
      ..imagePath = 'assets/images/back.png'
      ..shouldShowImage = false);

    items.add(AchievementModel()
      ..title = 'Master MochiFairy'
      ..subTitle = 'マスターの餅妖精を獲得した\n偉いです'
      ..imagePath = 'assets/images/back.png'
      ..shouldShowImage = false);

    items.add(AchievementModel()
      ..title = 'Devil MochiFairy'
      ..subTitle = '悪魔の餅妖精を獲得した\n闇落ちしました'
      ..imagePath = 'assets/images/back.png'
      ..shouldShowImage = false);

    items.add(AchievementModel()
      ..title = 'Angel MochiFairy'
      ..subTitle = '天使の餅妖精を獲得した\n贅沢だなぁ'
      ..imagePath = 'assets/images/back.png'
      ..shouldShowImage = false);

    items.add(AchievementModel()
      ..title = 'God MochiFairy'
      ..subTitle = '神の餅妖精を獲得した\nすごいことはわかる'
      ..imagePath = 'assets/images/back.png'
      ..shouldShowImage = false);

    // -----------------------ここからMochiTree---------------------------
    items.add(AchievementModel()
      ..title = 'Iron MochiTree'
      ..subTitle = '鉄の餅の成る木を獲得した\nロボボ...'
      ..imagePath = 'assets/images/back.png'
      ..shouldShowImage = false);

    items.add(AchievementModel()
      ..title = 'Bronze MochiTree'
      ..subTitle = '銅の餅の成る木を獲得した\nオブジェ'
      ..imagePath = 'assets/images/back.png'
      ..shouldShowImage = false);

    items.add(AchievementModel()
      ..title = 'Silver MochiTree'
      ..subTitle = '銀の餅の成る木を獲得した\nメッキだよね?'
      ..imagePath = 'assets/images/back.png'
      ..shouldShowImage = false);

    items.add(AchievementModel()
      ..title = 'Gold MochiTree'
      ..subTitle = '金の餅の成る木を獲得した\n金箔です。'
      ..imagePath = 'assets/images/back.png'
      ..shouldShowImage = false);

    items.add(AchievementModel()
      ..title = 'Platinum MochiTree'
      ..subTitle = 'プラチナの餅の成る木を獲得した\nアズユーライク'
      ..imagePath = 'assets/images/back.png'
      ..shouldShowImage = false);

    items.add(AchievementModel()
      ..title = 'Diamond MochiTree'
      ..subTitle = 'ダイヤの餅の成る木を獲得した\n取り放題'
      ..imagePath = 'assets/images/back.png'
      ..shouldShowImage = false);

    items.add(AchievementModel()
      ..title = 'Master MochiTree'
      ..subTitle = 'マスターの餅の成る木を獲得した\nなんか怖い'
      ..imagePath = 'assets/images/back.png'
      ..shouldShowImage = false);

    items.add(AchievementModel()
      ..title = 'Devil MochiTree'
      ..subTitle = '悪魔の餅の成る木を獲得した\n禍々しい'
      ..imagePath = 'assets/images/back.png'
      ..shouldShowImage = false);

    items.add(AchievementModel()
      ..title = 'Angel MochiTree'
      ..subTitle = '天使の餅の成る木を獲得した\nふわふわ～～～'
      ..imagePath = 'assets/images/back.png'
      ..shouldShowImage = false);

    items.add(AchievementModel()
      ..title = 'God MochiTree'
      ..subTitle = '神の餅の成る木を獲得した\n禁忌の餅です'
      ..imagePath = 'assets/images/back.png'
      ..shouldShowImage = false);

    // -----------------------ここからMochiVolcano---------------------------
    items.add(AchievementModel()
      ..title = 'Iron MochiVolcano'
      ..subTitle = '鉄の餅火山を獲得した\n鉄分豊富!'
      ..imagePath = 'assets/images/back.png'
      ..shouldShowImage = false);

    items.add(AchievementModel()
      ..title = 'Bronze MochiVolcano'
      ..subTitle = '銅の餅火山を獲得した\n有害です'
      ..imagePath = 'assets/images/back.png'
      ..shouldShowImage = false);

    items.add(AchievementModel()
      ..title = 'Silver MochiVolcano'
      ..subTitle = '銀の餅火山を獲得した\n噴火時の効果音がすごい'
      ..imagePath = 'assets/images/back.png'
      ..shouldShowImage = false);

    items.add(AchievementModel()
      ..title = 'Gold MochiVolcano'
      ..subTitle = '金の餅火山を獲得した\n金が降り注ぎます'
      ..imagePath = 'assets/images/back.png'
      ..shouldShowImage = false);

    items.add(AchievementModel()
      ..title = 'Platinum MochiVolcano'
      ..subTitle = 'プラチナの餅火山を獲得した\nいいね!'
      ..imagePath = 'assets/images/back.png'
      ..shouldShowImage = false);

    items.add(AchievementModel()
      ..title = 'Diamond MochiVolcano'
      ..subTitle = 'ダイヤの餅火山を獲得した\n尖った部分が当たらないといいですね'
      ..imagePath = 'assets/images/back.png'
      ..shouldShowImage = false);

    items.add(AchievementModel()
      ..title = 'Master MochiVolcano'
      ..subTitle = 'マスターの餅火山を獲得した\n修羅の山です'
      ..imagePath = 'assets/images/back.png'
      ..shouldShowImage = false);

    items.add(AchievementModel()
      ..title = 'Devil MochiVolcano'
      ..subTitle = '悪魔の餅火山を獲得した\nデビルマウンテン'
      ..imagePath = 'assets/images/back.png'
      ..shouldShowImage = false);

    items.add(AchievementModel()
      ..title = 'Angel MochiVolcano'
      ..subTitle = '天使の餅火山を獲得した\n天に召される。'
      ..imagePath = 'assets/images/back.png'
      ..shouldShowImage = false);

    items.add(AchievementModel()
      ..title = 'God MochiVolcano'
      ..subTitle = '神の餅火山を獲得した\n怒りを買うかも。'
      ..imagePath = 'assets/images/back.png'
      ..shouldShowImage = false);

    // -----------------------ここからMochiContinent---------------------------
    items.add(AchievementModel()
      ..title = 'Iron MochiContinent'
      ..subTitle = '鉄の餅大陸を獲得した\n巨大な鉄板餅'
      ..imagePath = 'assets/images/back.png'
      ..shouldShowImage = false);

    items.add(AchievementModel()
      ..title = 'Bronze MochiContinent'
      ..subTitle = '銅の餅大陸を獲得した\nビリリ'
      ..imagePath = 'assets/images/back.png'
      ..shouldShowImage = false);

    items.add(AchievementModel()
      ..title = 'Silver MochiContinent'
      ..subTitle = '銀の餅大陸を獲得した\nふつくしい...'
      ..imagePath = 'assets/images/back.png'
      ..shouldShowImage = false);

    items.add(AchievementModel()
      ..title = 'Gold MochiContinent'
      ..subTitle = '金の餅大陸を獲得した\n戦争が起こりそう'
      ..imagePath = 'assets/images/back.png'
      ..shouldShowImage = false);

    items.add(AchievementModel()
      ..title = 'Platinum MochiContinent'
      ..subTitle = 'プラチナの餅大陸を獲得した\nなんでそんなにでかいの'
      ..imagePath = 'assets/images/back.png'
      ..shouldShowImage = false);

    items.add(AchievementModel()
      ..title = 'Diamond MochiContinent'
      ..subTitle = 'ダイヤの餅大陸を獲得した\n何カラットなんだ'
      ..imagePath = 'assets/images/back.png'
      ..shouldShowImage = false);

    items.add(AchievementModel()
      ..title = 'Master MochiContinent'
      ..subTitle = 'マスターの餅大陸を獲得した\n猛者がいっぱい'
      ..imagePath = 'assets/images/back.png'
      ..shouldShowImage = false);

    items.add(AchievementModel()
      ..title = 'Devil MochiContinent'
      ..subTitle = '悪魔の餅大陸を獲得した\n悪魔もいっぱい'
      ..imagePath = 'assets/images/back.png'
      ..shouldShowImage = false);

    items.add(AchievementModel()
      ..title = 'Angel MochiContinent'
      ..subTitle = '天使の餅大陸を獲得した\n天使もいっぱい'
      ..imagePath = 'assets/images/back.png'
      ..shouldShowImage = false);

    items.add(AchievementModel()
      ..title = 'God MochiContinent'
      ..subTitle = '神の餅大陸を獲得した\nあーすごい!'
      ..imagePath = 'assets/images/back.png'
      ..shouldShowImage = false);

    // -----------------------ここからMochiOcean---------------------------
    items.add(AchievementModel()
      ..title = 'Iron MochiOcean'
      ..subTitle = '鉄の餅の海を獲得した\nうーん、泳げない'
      ..imagePath = 'assets/images/back.png'
      ..shouldShowImage = false);

    items.add(AchievementModel()
      ..title = 'Bronze MochiOcean'
      ..subTitle = '銅の餅の海を獲得した\n錆びてる...'
      ..imagePath = 'assets/images/back.png'
      ..shouldShowImage = false);

    items.add(AchievementModel()
      ..title = 'Silver MochiOcean'
      ..subTitle = '銀の餅の海を獲得した\nうわっ眩しい!!!!'
      ..imagePath = 'assets/images/back.png'
      ..shouldShowImage = false);

    items.add(AchievementModel()
      ..title = 'Gold MochiOcean'
      ..subTitle = '金の餅の海を獲得した\n溺れたい...'
      ..imagePath = 'assets/images/back.png'
      ..shouldShowImage = false);

    items.add(AchievementModel()
      ..title = 'Platinum MochiOcean'
      ..subTitle = 'プラチナの餅の海を獲得した\n沈みたい...'
      ..imagePath = 'assets/images/back.png'
      ..shouldShowImage = false);

    items.add(AchievementModel()
      ..title = 'Diamond MochiOcean'
      ..subTitle = 'ダイヤの餅の海を獲得した\n絶対痛い'
      ..imagePath = 'assets/images/back.png'
      ..shouldShowImage = false);

    items.add(AchievementModel()
      ..title = 'Master MochiOcean'
      ..subTitle = 'マスターの餅の海を獲得した\n強いものしか泳げない'
      ..imagePath = 'assets/images/back.png'
      ..shouldShowImage = false);

    items.add(AchievementModel()
      ..title = 'Devil MochiOcean'
      ..subTitle = '悪魔の餅の海を獲得した\n大丈夫かなぁ...'
      ..imagePath = 'assets/images/back.png'
      ..shouldShowImage = false);

    items.add(AchievementModel()
      ..title = 'Angel MochiOcean'
      ..subTitle = '天使の餅の海を獲得した\nあ、三途の川が見える...'
      ..imagePath = 'assets/images/back.png'
      ..shouldShowImage = false);

    items.add(AchievementModel()
      ..title = 'God MochiOcean'
      ..subTitle = '神の餅の海を獲得した\nなんかデカいのが泳いでるなぁ'
      ..imagePath = 'assets/images/back.png'
      ..shouldShowImage = false);

    // -----------------------ここからMochiPlanet---------------------------
    items.add(AchievementModel()
      ..title = 'Iron MochiPlanet'
      ..subTitle = '鉄の餅の惑星を獲得した\nなんか車とかいっぱいくっついてる'
      ..imagePath = 'assets/images/back.png'
      ..shouldShowImage = false);

    items.add(AchievementModel()
      ..title = 'Bronze MochiPlanet'
      ..subTitle = '銅の餅の惑星を獲得した\n緑豊かに見える'
      ..imagePath = 'assets/images/back.png'
      ..shouldShowImage = false);

    items.add(AchievementModel()
      ..title = 'Silver MochiPlanet'
      ..subTitle = '銀の餅の惑星を獲得した\n輝きすぎ'
      ..imagePath = 'assets/images/back.png'
      ..shouldShowImage = false);

    items.add(AchievementModel()
      ..title = 'Gold MochiPlanet'
      ..subTitle = '金の餅の惑星を獲得した\n石油王もびっくり'
      ..imagePath = 'assets/images/back.png'
      ..shouldShowImage = false);

    items.add(AchievementModel()
      ..title = 'Platinum MochiPlanet'
      ..subTitle = 'プラチナの餅の惑星を獲得した\n銀の惑星とどう違うの?'
      ..imagePath = 'assets/images/back.png'
      ..shouldShowImage = false);

    items.add(AchievementModel()
      ..title = 'Diamond MochiPlanet'
      ..subTitle = 'ダイヤの餅の惑星を獲得した\nこれを指にはめるのは無理ってもんだ'
      ..imagePath = 'assets/images/back.png'
      ..shouldShowImage = false);

    items.add(AchievementModel()
      ..title = 'Master MochiPlanet'
      ..subTitle = 'マスターの餅の惑星を獲得した\nオラわくわくすっぞ!!!'
      ..imagePath = 'assets/images/back.png'
      ..shouldShowImage = false);

    items.add(AchievementModel()
      ..title = 'Devil MochiPlanet'
      ..subTitle = '悪魔の餅の惑星を獲得した\nそういう星もありそうだね'
      ..imagePath = 'assets/images/back.png'
      ..shouldShowImage = false);

    items.add(AchievementModel()
      ..title = 'Angel MochiPlanet'
      ..subTitle = '天使の餅の惑星を獲得した\n羽生えてる宇宙人もいるかもね'
      ..imagePath = 'assets/images/back.png'
      ..shouldShowImage = false);

    items.add(AchievementModel()
      ..title = 'God MochiPlanet'
      ..subTitle = '神の餅の惑星を獲得した\nめちゃデカそう'
      ..imagePath = 'assets/images/back.png'
      ..shouldShowImage = false);

    // -----------------------ここからMochiGalaxy---------------------------
    items.add(AchievementModel()
      ..title = 'Iron MochiGalaxy'
      ..subTitle = '鉄の餅銀河を獲得した\n発見してみたいね。'
      ..imagePath = 'assets/images/back.png'
      ..shouldShowImage = false);

    items.add(AchievementModel()
      ..title = 'Bronze MochiGalaxy'
      ..subTitle = '銅の餅銀河を獲得した\n銅線作り放題。'
      ..imagePath = 'assets/images/back.png'
      ..shouldShowImage = false);

    items.add(AchievementModel()
      ..title = 'Silver MochiGalaxy'
      ..subTitle = '銀の餅銀河を獲得した\nいっぱい食器作ろう'
      ..imagePath = 'assets/images/back.png'
      ..shouldShowImage = false);

    items.add(AchievementModel()
      ..title = 'Gold MochiGalaxy'
      ..subTitle = '金の餅銀河を獲得した\n助かるぅ'
      ..imagePath = 'assets/images/back.png'
      ..shouldShowImage = false);

    items.add(AchievementModel()
      ..title = 'Platinum MochiGalaxy'
      ..subTitle = 'プラチナの餅銀河を獲得した\n貴重なもんがこんなにあっていいんですか???'
      ..imagePath = 'assets/images/back.png'
      ..shouldShowImage = false);

    items.add(AchievementModel()
      ..title = 'Diamond MochiGalaxy'
      ..subTitle = 'ダイヤの餅銀河を獲得した\nキラッ!'
      ..imagePath = 'assets/images/back.png'
      ..shouldShowImage = false);

    items.add(AchievementModel()
      ..title = 'Master MochiGalaxy'
      ..subTitle = 'マスターの餅銀河を獲得した\n脳筋居すぎだよ...'
      ..imagePath = 'assets/images/back.png'
      ..shouldShowImage = false);

    items.add(AchievementModel()
      ..title = 'Devil MochiGalaxy'
      ..subTitle = '悪魔の餅銀河を獲得した\nそのうち攻め込んできそう'
      ..imagePath = 'assets/images/back.png'
      ..shouldShowImage = false);

    items.add(AchievementModel()
      ..title = 'Angel MochiGalaxy'
      ..subTitle = '天使の餅銀河を獲得した\n悪魔退治しておいてほしい'
      ..imagePath = 'assets/images/back.png'
      ..shouldShowImage = false);

    items.add(AchievementModel()
      ..title = 'God MochiGalaxy'
      ..subTitle = '神の餅銀河を獲得した\nちゃんと統治して'
      ..imagePath = 'assets/images/back.png'
      ..shouldShowImage = false);

    // -----------------------ここからMochiCluster---------------------------
    items.add(AchievementModel()
      ..title = 'Iron MochiCluster'
      ..subTitle = '鉄の餅銀河団を獲得した\nファンタジーやSFが過ぎるよ'
      ..imagePath = 'assets/images/back.png'
      ..shouldShowImage = false);

    items.add(AchievementModel()
      ..title = 'Bronze MochiCluster'
      ..subTitle = '銅の餅銀河団を獲得した\n作者は頭ぱっぱらぱーか？'
      ..imagePath = 'assets/images/back.png'
      ..shouldShowImage = false);

    items.add(AchievementModel()
      ..title = 'Silver MochiCluster'
      ..subTitle = '銀の餅銀河団を獲得した\nうーん'
      ..imagePath = 'assets/images/back.png'
      ..shouldShowImage = false);

    items.add(AchievementModel()
      ..title = 'Gold MochiCluster'
      ..subTitle = '金の餅銀河団を獲得した\nそうかもしれない'
      ..imagePath = 'assets/images/back.png'
      ..shouldShowImage = false);

    items.add(AchievementModel()
      ..title = 'Platinum MochiCluster'
      ..subTitle = 'プラチナの餅銀河団を獲得した\nこんなとこないだろ'
      ..imagePath = 'assets/images/back.png'
      ..shouldShowImage = false);

    items.add(AchievementModel()
      ..title = 'Diamond MochiCluster'
      ..subTitle = 'ダイヤの餅銀河団を獲得した\nあったらいいけどな'
      ..imagePath = 'assets/images/back.png'
      ..shouldShowImage = false);

    items.add(AchievementModel()
      ..title = 'Master MochiCluster'
      ..subTitle = 'マスターの餅銀河団を獲得した\n持って帰れないな'
      ..imagePath = 'assets/images/back.png'
      ..shouldShowImage = false);

    items.add(AchievementModel()
      ..title = 'Devil MochiCluster'
      ..subTitle = '悪魔の餅銀河団を獲得した\nコストやばそうだよね'
      ..imagePath = 'assets/images/back.png'
      ..shouldShowImage = false);

    items.add(AchievementModel()
      ..title = 'Angel MochiCluster'
      ..subTitle = '天使の餅銀河団を獲得した\n人間がその領域まで'
      ..imagePath = 'assets/images/back.png'
      ..shouldShowImage = false);

    items.add(AchievementModel()
      ..title = 'God MochiCluster'
      ..subTitle = '神の餅銀河団を獲得した\n行けるだろうか'
      ..imagePath = 'assets/images/back.png'
      ..shouldShowImage = false);

    // -----------------------ここからMochiSuperCluster---------------------------
    items.add(AchievementModel()
      ..title = 'Iron MochiSuperCluster'
      ..subTitle = '鉄の餅超銀河団を獲得した\nなんとかウォーズかな?'
      ..imagePath = 'assets/images/back.png'
      ..shouldShowImage = false);

    items.add(AchievementModel()
      ..title = 'Bronze MochiSuperCluster'
      ..subTitle = '銅の餅超銀河団を獲得した\nはぇ～～'
      ..imagePath = 'assets/images/back.png'
      ..shouldShowImage = false);

    items.add(AchievementModel()
      ..title = 'Silver MochiSuperCluster'
      ..subTitle = '銀の餅超銀河団を獲得した\nひぇ～～～'
      ..imagePath = 'assets/images/back.png'
      ..shouldShowImage = false);

    items.add(AchievementModel()
      ..title = 'Gold MochiSuperCluster'
      ..subTitle = '金の餅超銀河団を獲得した\nふぇ～～～～～'
      ..imagePath = 'assets/images/back.png'
      ..shouldShowImage = false);

    items.add(AchievementModel()
      ..title = 'Platinum MochiSuperCluster'
      ..subTitle = 'プラチナの餅超銀河団を獲得した\nむりぽ'
      ..imagePath = 'assets/images/back.png'
      ..shouldShowImage = false);

    items.add(AchievementModel()
      ..title = 'Diamond MochiSuperCluster'
      ..subTitle = 'ダイヤの餅超銀河団を獲得した\nキラキラが過ぎるんじゃぁ'
      ..imagePath = 'assets/images/back.png'
      ..shouldShowImage = false);

    items.add(AchievementModel()
      ..title = 'Master MochiSuperCluster'
      ..subTitle = 'マスターの餅超銀河団を獲得した\nあー、はいはい、すごいね'
      ..imagePath = 'assets/images/back.png'
      ..shouldShowImage = false);

    items.add(AchievementModel()
      ..title = 'Devil MochiSuperCluster'
      ..subTitle = '悪魔の餅超銀河団を獲得した\nもうやばいってぇ'
      ..imagePath = 'assets/images/back.png'
      ..shouldShowImage = false);

    items.add(AchievementModel()
      ..title = 'Angel MochiSuperCluster'
      ..subTitle = '天使の餅超銀河団を獲得した\nそんなことある?'
      ..imagePath = 'assets/images/back.png'
      ..shouldShowImage = false);

    items.add(AchievementModel()
      ..title = 'God MochiSuperCluster'
      ..subTitle = '神の餅超銀河団を獲得した\nこっちのほうが無いわ'
      ..imagePath = 'assets/images/back.png'
      ..shouldShowImage = false);

    // -----------------------ここからMochiGreatWall---------------------------
    items.add(AchievementModel()
      ..title = 'Iron MochiGreatWall'
      ..subTitle = '鉄の餅GWを獲得した\n想像できない'
      ..imagePath = 'assets/images/back.png'
      ..shouldShowImage = false);

    items.add(AchievementModel()
      ..title = 'Bronze MochiGreatWall'
      ..subTitle = '銅の餅GWを獲得した\nコメント思いつかない'
      ..imagePath = 'assets/images/back.png'
      ..shouldShowImage = false);

    items.add(AchievementModel()
      ..title = 'Silver MochiGreatWall'
      ..subTitle = '銀の餅GWを獲得した\n塵も積もれば山となる'
      ..imagePath = 'assets/images/back.png'
      ..shouldShowImage = false);

    items.add(AchievementModel()
      ..title = 'Gold MochiGreatWall'
      ..subTitle = '金の餅GWを獲得した\n出る杭は打たれる'
      ..imagePath = 'assets/images/back.png'
      ..shouldShowImage = false);

    items.add(AchievementModel()
      ..title = 'Platinum MochiGreatWall'
      ..subTitle = 'プラチナの餅GWを獲得した\n五十歩百歩'
      ..imagePath = 'assets/images/back.png'
      ..shouldShowImage = false);

    items.add(AchievementModel()
      ..title = 'Diamond MochiGreatWall'
      ..subTitle = 'ダイヤの餅GWを獲得した\n百聞は一見に如かず'
      ..imagePath = 'assets/images/back.png'
      ..shouldShowImage = false);

    items.add(AchievementModel()
      ..title = 'Master MochiGreatWall'
      ..subTitle = 'マスターの餅GWを獲得した\n好きこそ物の上手なれ'
      ..imagePath = 'assets/images/back.png'
      ..shouldShowImage = false);

    items.add(AchievementModel()
      ..title = 'Devil MochiGreatWall'
      ..subTitle = '悪魔の餅GWを獲得した\n焼け石に水'
      ..imagePath = 'assets/images/back.png'
      ..shouldShowImage = false);

    items.add(AchievementModel()
      ..title = 'Angel MochiGreatWall'
      ..subTitle = '天使の餅GWを獲得した\n急がば回れ'
      ..imagePath = 'assets/images/back.png'
      ..shouldShowImage = false);

    items.add(AchievementModel()
      ..title = 'God MochiGreatWall'
      ..subTitle = '神の餅GWを獲得した\n雲泥の差'
      ..imagePath = 'assets/images/back.png'
      ..shouldShowImage = false);

    // -----------------------ここからMochiDimension---------------------------
    items.add(AchievementModel()
      ..title = 'Iron MochiDimension'
      ..subTitle = '鉄の餅次元を獲得した\n短気は損気'
      ..imagePath = 'assets/images/back.png'
      ..shouldShowImage = false);

    items.add(AchievementModel()
      ..title = 'Bronze MochiDimension'
      ..subTitle = '銅の餅次元を獲得した\n初心忘るべからず'
      ..imagePath = 'assets/images/back.png'
      ..shouldShowImage = false);

    items.add(AchievementModel()
      ..title = 'Silver MochiDimension'
      ..subTitle = '銀の餅次元を獲得した\n石橋を叩いて渡る'
      ..imagePath = 'assets/images/back.png'
      ..shouldShowImage = false);

    items.add(AchievementModel()
      ..title = 'Gold MochiDimension'
      ..subTitle = '金の餅次元を獲得した\n嘘も方便'
      ..imagePath = 'assets/images/back.png'
      ..shouldShowImage = false);

    items.add(AchievementModel()
      ..title = 'Platinum MochiDimension'
      ..subTitle = 'プラチナの餅次元を獲得した\n残り物には福がある'
      ..imagePath = 'assets/images/back.png'
      ..shouldShowImage = false);

    items.add(AchievementModel()
      ..title = 'Diamond MochiDimension'
      ..subTitle = 'ダイヤの餅次元を獲得した\n仏の顔も三度まで'
      ..imagePath = 'assets/images/back.png'
      ..shouldShowImage = false);

    items.add(AchievementModel()
      ..title = 'Master MochiDimension'
      ..subTitle = 'マスターの餅次元を獲得した\n棚から牡丹餅'
      ..imagePath = 'assets/images/back.png'
      ..shouldShowImage = false);

    items.add(AchievementModel()
      ..title = 'Devil MochiDimension'
      ..subTitle = '悪魔の餅次元を獲得した\n喉元過ぎれば熱さを忘れる'
      ..imagePath = 'assets/images/back.png'
      ..shouldShowImage = false);

    items.add(AchievementModel()
      ..title = 'Angel MochiDimension'
      ..subTitle = '天使の餅次元を獲得した\n暖簾に腕押し'
      ..imagePath = 'assets/images/back.png'
      ..shouldShowImage = false);

    items.add(AchievementModel()
      ..title = 'God MochiDimension'
      ..subTitle = '神の餅次元を獲得した\n早起きは三文の徳'
      ..imagePath = 'assets/images/back.png'
      ..shouldShowImage = false);

    // -----------------------ここからMochiGod---------------------------
    items.add(AchievementModel()
      ..title = 'Iron MochiGod'
      ..subTitle = '鉄の餅神を獲得した\n灯台下暗し'
      ..imagePath = 'assets/images/back.png'
      ..shouldShowImage = false);

    items.add(AchievementModel()
      ..title = 'Bronze MochiGod'
      ..subTitle = '銅の餅神を獲得した\n火の無い所に煙は立たぬ'
      ..imagePath = 'assets/images/back.png'
      ..shouldShowImage = false);

    items.add(AchievementModel()
      ..title = 'Silver MochiGod'
      ..subTitle = '銀の餅神を獲得した\n知らぬが仏'
      ..imagePath = 'assets/images/back.png'
      ..shouldShowImage = false);

    items.add(AchievementModel()
      ..title = 'Gold MochiGod'
      ..subTitle = '金の餅神を獲得した\n井の中の蛙大海を知らず'
      ..imagePath = 'assets/images/back.png'
      ..shouldShowImage = false);

    items.add(AchievementModel()
      ..title = 'Platinum MochiGod'
      ..subTitle = 'プラチナの餅神を獲得した\n猫に小判'
      ..imagePath = 'assets/images/back.png'
      ..shouldShowImage = false);

    items.add(AchievementModel()
      ..title = 'Diamond MochiGod'
      ..subTitle = 'ダイヤの餅神を獲得した\n同じ穴の狢'
      ..imagePath = 'assets/images/back.png'
      ..shouldShowImage = false);

    items.add(AchievementModel()
      ..title = 'Master MochiGod'
      ..subTitle = 'マスターの餅神を獲得した\n猫の手も借りたい'
      ..imagePath = 'assets/images/back.png'
      ..shouldShowImage = false);

    items.add(AchievementModel()
      ..title = 'Devil MochiGod'
      ..subTitle = '悪魔の餅神を獲得した\n鉄は熱いうちに打て'
      ..imagePath = 'assets/images/back.png'
      ..shouldShowImage = false);

    items.add(AchievementModel()
      ..title = 'Angel MochiGod'
      ..subTitle = '天使の餅神を獲得した\n青天の霹靂'
      ..imagePath = 'assets/images/back.png'
      ..shouldShowImage = false);

    items.add(AchievementModel()
      ..title = 'God MochiGod'
      ..subTitle = '神の餅神を獲得した\n最後のアチーブ、おめでとう'
      ..imagePath = 'assets/images/back.png'
      ..shouldShowImage = false);

    await _isar.writeTxn(() async {
      await _isar.achievementModels.putAll(items);
    });
  }

  Future<void> updateShouldShowImage(int index, bool value) async {
    achievementData[index].shouldShowImage = value;
    await _isar.writeTxn(() async {
      await _isar.achievementModels.put(achievementData[index]);
    });
    notifyListeners();
  }

  Future<void> resetShouldShowImage() async {
    // 初期値の代入
    for (int i = 0; i < achievementData.length; i++) {
      achievementData[i].shouldShowImage = true;
      await _isar.writeTxn(() async {
        await _isar.achievementModels.put(achievementData[i]);
      });
    }

    // ロード
    _achievementData = (await _isar.achievementModels.getAll(ids))
        .where((item) => item != null)
        .map((item) => item!)
        .toList();
    notifyListeners();
  }
}
