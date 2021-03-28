class HeroStatusModel {
  int id;
  String name;
  String localizedName;
  String primaryAttr;
  String attackType;
  List<String> roles;
  String img;
  String icon;
  dynamic baseHealth;
  dynamic baseHealthRegen;
  dynamic baseMana;
  dynamic baseManaRegen;
  dynamic baseArmor;
  dynamic baseMr;
  dynamic baseAttackMin;
  dynamic baseAttackMax;
  dynamic baseStr;
  dynamic baseAgi;
  dynamic baseInt;
  dynamic strGain;
  dynamic agiGain;
  dynamic intGain;
  dynamic attackRange;
  dynamic projectileSpeed;
  dynamic attackRate;
  dynamic moveSpeed;
  dynamic turnRate;
  bool cmEnabled;
  dynamic legs;
  dynamic heroId;
  dynamic turboPicks;
  dynamic turboWins;
  dynamic proBan;
  dynamic proWin;
  dynamic proPick;
  dynamic i1Pick;
  dynamic i1Win;
  dynamic i2Pick;
  dynamic i2Win;
  dynamic i3Pick;
  dynamic i3Win;
  dynamic i4Pick;
  dynamic i4Win;
  dynamic i5Pick;
  dynamic i5Win;
  dynamic i6Pick;
  dynamic i6Win;
  dynamic i7Pick;
  dynamic i7Win;
  dynamic i8Pick;
  dynamic i8Win;
  dynamic nullPick;
  dynamic nullWin;

  HeroStatusModel(
      {this.id,
      this.name,
      this.localizedName,
      this.primaryAttr,
      this.attackType,
      this.roles,
      this.img,
      this.icon,
      this.baseHealth,
      this.baseHealthRegen,
      this.baseMana,
      this.baseManaRegen,
      this.baseArmor,
      this.baseMr,
      this.baseAttackMin,
      this.baseAttackMax,
      this.baseStr,
      this.baseAgi,
      this.baseInt,
      this.strGain,
      this.agiGain,
      this.intGain,
      this.attackRange,
      this.projectileSpeed,
      this.attackRate,
      this.moveSpeed,
      this.turnRate,
      this.cmEnabled,
      this.legs,
      this.heroId,
      this.turboPicks,
      this.turboWins,
      this.proBan,
      this.proWin,
      this.proPick,
      this.i1Pick,
      this.i1Win,
      this.i2Pick,
      this.i2Win,
      this.i3Pick,
      this.i3Win,
      this.i4Pick,
      this.i4Win,
      this.i5Pick,
      this.i5Win,
      this.i6Pick,
      this.i6Win,
      this.i7Pick,
      this.i7Win,
      this.i8Pick,
      this.i8Win,
      this.nullPick,
      this.nullWin});

  HeroStatusModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    localizedName = json['localized_name'];
    primaryAttr = json['primary_attr'];
    attackType = json['attack_type'];
    roles = json['roles'].cast<String>();
    img = json['img'];
    icon = json['icon'];
    baseHealth = json['base_health'];
    baseHealthRegen = json['base_health_regen'];
    baseMana = json['base_mana'];
    baseManaRegen = json['base_mana_regen'];
    baseArmor = json['base_armor'];
    baseMr = json['base_mr'];
    baseAttackMin = json['base_attack_min'];
    baseAttackMax = json['base_attack_max'];
    baseStr = json['base_str'];
    baseAgi = json['base_agi'];
    baseInt = json['base_int'];
    strGain = json['str_gain'];
    agiGain = json['agi_gain'];
    intGain = json['int_gain'];
    attackRange = json['attack_range'];
    projectileSpeed = json['projectile_speed'];
    attackRate = json['attack_rate'];
    moveSpeed = json['move_speed'];
    turnRate = json['turn_rate'];
    cmEnabled = json['cm_enabled'];
    legs = json['legs'];
    heroId = json['hero_id'];
    turboPicks = json['turbo_picks'];
    turboWins = json['turbo_wins'];
    proBan = json['pro_ban'];
    proWin = json['pro_win'];
    proPick = json['pro_pick'];
    i1Pick = json['1_pick'];
    i1Win = json['1_win'];
    i2Pick = json['2_pick'];
    i2Win = json['2_win'];
    i3Pick = json['3_pick'];
    i3Win = json['3_win'];
    i4Pick = json['4_pick'];
    i4Win = json['4_win'];
    i5Pick = json['5_pick'];
    i5Win = json['5_win'];
    i6Pick = json['6_pick'];
    i6Win = json['6_win'];
    i7Pick = json['7_pick'];
    i7Win = json['7_win'];
    i8Pick = json['8_pick'];
    i8Win = json['8_win'];
    nullPick = json['null_pick'];
    nullWin = json['null_win'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['localized_name'] = this.localizedName;
    data['primary_attr'] = this.primaryAttr;
    data['attack_type'] = this.attackType;
    data['roles'] = this.roles;
    data['img'] = this.img;
    data['icon'] = this.icon;
    data['base_health'] = this.baseHealth;
    data['base_health_regen'] = this.baseHealthRegen;
    data['base_mana'] = this.baseMana;
    data['base_mana_regen'] = this.baseManaRegen;
    data['base_armor'] = this.baseArmor;
    data['base_mr'] = this.baseMr;
    data['base_attack_min'] = this.baseAttackMin;
    data['base_attack_max'] = this.baseAttackMax;
    data['base_str'] = this.baseStr;
    data['base_agi'] = this.baseAgi;
    data['base_int'] = this.baseInt;
    data['str_gain'] = this.strGain;
    data['agi_gain'] = this.agiGain;
    data['int_gain'] = this.intGain;
    data['attack_range'] = this.attackRange;
    data['projectile_speed'] = this.projectileSpeed;
    data['attack_rate'] = this.attackRate;
    data['move_speed'] = this.moveSpeed;
    data['turn_rate'] = this.turnRate;
    data['cm_enabled'] = this.cmEnabled;
    data['legs'] = this.legs;
    data['hero_id'] = this.heroId;
    data['turbo_picks'] = this.turboPicks;
    data['turbo_wins'] = this.turboWins;
    data['pro_ban'] = this.proBan;
    data['pro_win'] = this.proWin;
    data['pro_pick'] = this.proPick;
    data['1_pick'] = this.i1Pick;
    data['1_win'] = this.i1Win;
    data['2_pick'] = this.i2Pick;
    data['2_win'] = this.i2Win;
    data['3_pick'] = this.i3Pick;
    data['3_win'] = this.i3Win;
    data['4_pick'] = this.i4Pick;
    data['4_win'] = this.i4Win;
    data['5_pick'] = this.i5Pick;
    data['5_win'] = this.i5Win;
    data['6_pick'] = this.i6Pick;
    data['6_win'] = this.i6Win;
    data['7_pick'] = this.i7Pick;
    data['7_win'] = this.i7Win;
    data['8_pick'] = this.i8Pick;
    data['8_win'] = this.i8Win;
    data['null_pick'] = this.nullPick;
    data['null_win'] = this.nullWin;
    return data;
  }
}
