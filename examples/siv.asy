import atoms;
unitsize(1cm);
//currentprojection  = perspective(1,1,1);
//settings.prc       = false;
//settings.render    = 10; //quality
//settings.outformat = "png"; //output 
real bond_radius = 3.0;
real radius_scale = 0.2;
real max_dist = 1.2;
AtomCollection ATOMS;

Atom ATOM_1   = Atom("C", (0.0, 0.0, 0.0)).setLabel("1").scaleRadius(radius_scale);
Atom ATOM_2   = Atom("C", (0.5, 0.5, 0.5)).setLabel("2").scaleRadius(radius_scale);
Atom ATOM_3   = Atom("C", (1.0, 0.0, 1.0)).setLabel("3").scaleRadius(radius_scale);
Atom ATOM_4   = Atom("C", (1.5, 0.5, 1.5)).setLabel("4").scaleRadius(radius_scale);
Atom ATOM_5   = Atom("C", (0.0, 1.0, 1.0)).setLabel("5").scaleRadius(radius_scale);
Atom ATOM_6   = Atom("C", (0.5, 1.5, 1.5)).setLabel("6").scaleRadius(radius_scale);
Atom ATOM_7   = Atom("C", (1.0, 1.0, 2.0)).setLabel("7").scaleRadius(radius_scale);
Atom ATOM_8   = Atom("C", (1.5, 1.5, 2.5)).setLabel("8").scaleRadius(radius_scale);
Atom ATOM_9   = Atom("C", (1.0, 1.0, 0.0)).setLabel("9").scaleRadius(radius_scale);
Atom ATOM_10  = Atom("C", (1.5, 1.5, 0.5)).setLabel("10").scaleRadius(radius_scale);
Atom ATOM_11  = Atom("C", (2.0, 1.0, 1.0)).setLabel("11").scaleRadius(radius_scale);
Atom ATOM_12  = Atom("C", (2.5, 1.5, 1.5)).setLabel("12").scaleRadius(radius_scale);
Atom ATOM_13  = Atom("C", (1.0, 2.0, 1.0)).setLabel("13").scaleRadius(radius_scale);
Atom ATOM_14  = Atom("C", (1.5, 2.5, 1.5)).setLabel("14").scaleRadius(radius_scale);
Atom ATOM_15  = Atom("C", (2.0, 2.0, 2.0)).setLabel("15").scaleRadius(radius_scale);
Atom ATOM_16  = Atom("C", (2.5, 2.5, 2.5)).setLabel("16").scaleRadius(radius_scale);
Atom ATOM_17  = Atom("C", (2.0, 0.0, 2.0)).setLabel("17").scaleRadius(radius_scale);
Atom ATOM_18  = Atom("C", (2.5, 0.5, 2.5)).setLabel("18").scaleRadius(radius_scale);
Atom ATOM_19  = Atom("C", (3.0, 0.0, 3.0)).setLabel("19").scaleRadius(radius_scale);
Atom ATOM_20  = Atom("C", (3.5, 0.5, 3.5)).setLabel("20").scaleRadius(radius_scale);
Atom ATOM_21  = Atom("C", (2.0, 1.0, 3.0)).setLabel("21").scaleRadius(radius_scale);
Atom ATOM_22  = Atom("C", (2.5, 1.5, 3.5)).setLabel("22").scaleRadius(radius_scale);
Atom ATOM_23  = Atom("C", (3.0, 1.0, 4.0)).setLabel("23").scaleRadius(radius_scale);
Atom ATOM_24  = Atom("C", (3.5, 1.5, 4.5)).setLabel("24").scaleRadius(radius_scale);
Atom ATOM_25  = Atom("C", (3.0, 1.0, 2.0)).setLabel("25").scaleRadius(radius_scale);
Atom ATOM_26  = Atom("C", (3.5, 1.5, 2.5)).setLabel("26").scaleRadius(radius_scale);
Atom ATOM_27  = Atom("C", (4.0, 1.0, 3.0)).setLabel("27").scaleRadius(radius_scale);
Atom ATOM_28  = Atom("C", (4.5, 1.5, 3.5)).setLabel("28").scaleRadius(radius_scale);
Atom ATOM_29  = Atom("C", (3.0, 2.0, 3.0)).setLabel("29").scaleRadius(radius_scale);
Atom ATOM_30  = Atom("C", (3.5, 2.5, 3.5)).setLabel("30").scaleRadius(radius_scale);
Atom ATOM_31  = Atom("C", (4.0, 2.0, 4.0)).setLabel("31").scaleRadius(radius_scale);
Atom ATOM_32  = Atom("C", (4.5, 2.5, 4.5)).setLabel("32").scaleRadius(radius_scale);
Atom ATOM_33  = Atom("C", (0.0, 2.0, 2.0)).setLabel("33").scaleRadius(radius_scale);
Atom ATOM_34  = Atom("C", (0.5, 2.5, 2.5)).setLabel("34").scaleRadius(radius_scale);
Atom ATOM_35  = Atom("C", (1.0, 2.0, 3.0)).setLabel("35").scaleRadius(radius_scale);
Atom ATOM_36  = Atom("C", (1.5, 2.5, 3.5)).setLabel("36").scaleRadius(radius_scale);
Atom ATOM_37  = Atom("C", (0.0, 3.0, 3.0)).setLabel("37").scaleRadius(radius_scale);
Atom ATOM_38  = Atom("C", (0.5, 3.5, 3.5)).setLabel("38").scaleRadius(radius_scale);
Atom ATOM_39  = Atom("C", (1.0, 3.0, 4.0)).setLabel("39").scaleRadius(radius_scale);
Atom ATOM_40  = Atom("C", (1.5, 3.5, 4.5)).setLabel("40").scaleRadius(radius_scale);
Atom ATOM_41  = Atom("C", (1.0, 3.0, 2.0)).setLabel("41").scaleRadius(radius_scale);
Atom ATOM_42  = Atom("C", (1.5, 3.5, 2.5)).setLabel("42").scaleRadius(radius_scale);
Atom ATOM_43  = Atom("C", (2.0, 3.0, 3.0)).setLabel("43").scaleRadius(radius_scale);
Atom ATOM_44  = Atom("C", (2.5, 3.5, 3.5)).setLabel("44").scaleRadius(radius_scale);
Atom ATOM_45  = Atom("C", (1.0, 4.0, 3.0)).setLabel("45").scaleRadius(radius_scale);
Atom ATOM_46  = Atom("C", (1.5, 4.5, 3.5)).setLabel("46").scaleRadius(radius_scale);
Atom ATOM_47  = Atom("C", (2.0, 4.0, 4.0)).setLabel("47").scaleRadius(radius_scale);
Atom ATOM_48  = Atom("C", (2.5, 4.5, 4.5)).setLabel("48").scaleRadius(radius_scale);
Atom ATOM_49  = Atom("C", (2.0, 2.0, 4.0)).setLabel("49").scaleRadius(radius_scale);
Atom ATOM_50  = Atom("C", (2.5, 2.5, 4.5)).setLabel("50").scaleRadius(radius_scale);
Atom ATOM_51  = Atom("C", (3.0, 2.0, 5.0)).setLabel("51").scaleRadius(radius_scale);
Atom ATOM_52  = Atom("C", (3.5, 2.5, 5.5)).setLabel("52").scaleRadius(radius_scale);
Atom ATOM_53  = Atom("C", (2.0, 3.0, 5.0)).setLabel("53").scaleRadius(radius_scale);
Atom ATOM_54  = Atom("C", (2.5, 3.5, 5.5)).setLabel("54").scaleRadius(radius_scale);
Atom ATOM_55  = Atom("C", (3.0, 3.0, 6.0)).setLabel("55").scaleRadius(radius_scale);
Atom ATOM_56  = Atom("C", (3.5, 3.5, 6.5)).setLabel("56").scaleRadius(radius_scale);
Atom ATOM_57  = Atom("C", (3.0, 3.0, 4.0)).setLabel("57").scaleRadius(radius_scale);
Atom ATOM_58  = Atom("C", (3.5, 3.5, 4.5)).setLabel("58").scaleRadius(radius_scale);
Atom ATOM_59  = Atom("C", (4.0, 3.0, 5.0)).setLabel("59").scaleRadius(radius_scale);
Atom ATOM_60  = Atom("C", (4.5, 3.5, 5.5)).setLabel("60").scaleRadius(radius_scale);
Atom ATOM_61  = Atom("C", (3.0, 4.0, 5.0)).setLabel("61").scaleRadius(radius_scale);
Atom ATOM_62  = Atom("C", (3.5, 4.5, 5.5)).setLabel("62").scaleRadius(radius_scale);
Atom ATOM_63  = Atom("C", (4.0, 4.0, 6.0)).setLabel("63").scaleRadius(radius_scale);
Atom ATOM_64  = Atom("C", (4.5, 4.5, 6.5)).setLabel("64").scaleRadius(radius_scale);
Atom ATOM_65  = Atom("C", (2.0, 2.0, 0.0)).setLabel("65").scaleRadius(radius_scale);
Atom ATOM_66  = Atom("C", (2.5, 2.5, 0.5)).setLabel("66").scaleRadius(radius_scale);
Atom ATOM_67  = Atom("C", (3.0, 2.0, 1.0)).setLabel("67").scaleRadius(radius_scale);
Atom ATOM_68  = Atom("C", (3.5, 2.5, 1.5)).setLabel("68").scaleRadius(radius_scale);
Atom ATOM_69  = Atom("C", (2.0, 3.0, 1.0)).setLabel("69").scaleRadius(radius_scale);
Atom ATOM_70  = Atom("C", (2.5, 3.5, 1.5)).setLabel("70").scaleRadius(radius_scale);
Atom ATOM_71  = Atom("C", (3.0, 3.0, 2.0)).setLabel("71").scaleRadius(radius_scale);
Atom ATOM_72  = Atom("C", (3.5, 3.5, 2.5)).setLabel("72").scaleRadius(radius_scale);
Atom ATOM_73  = Atom("C", (3.0, 3.0, 0.0)).setLabel("73").scaleRadius(radius_scale);
Atom ATOM_74  = Atom("C", (3.5, 3.5, 0.5)).setLabel("74").scaleRadius(radius_scale);
Atom ATOM_75  = Atom("C", (4.0, 3.0, 1.0)).setLabel("75").scaleRadius(radius_scale);
Atom ATOM_76  = Atom("C", (4.5, 3.5, 1.5)).setLabel("76").scaleRadius(radius_scale);
Atom ATOM_77  = Atom("C", (3.0, 4.0, 1.0)).setLabel("77").scaleRadius(radius_scale);
Atom ATOM_78  = Atom("C", (3.5, 4.5, 1.5)).setLabel("78").scaleRadius(radius_scale);
Atom ATOM_79  = Atom("C", (4.0, 4.0, 2.0)).setLabel("79").scaleRadius(radius_scale);
Atom ATOM_80  = Atom("C", (4.5, 4.5, 2.5)).setLabel("80").scaleRadius(radius_scale);
Atom ATOM_81  = Atom("C", (4.0, 2.0, 2.0)).setLabel("81").scaleRadius(radius_scale);
Atom ATOM_82  = Atom("C", (4.5, 2.5, 2.5)).setLabel("82").scaleRadius(radius_scale);
Atom ATOM_83  = Atom("C", (5.0, 2.0, 3.0)).setLabel("83").scaleRadius(radius_scale);
Atom ATOM_84  = Atom("C", (5.5, 2.5, 3.5)).setLabel("84").scaleRadius(radius_scale);
Atom ATOM_85  = Atom("C", (4.0, 3.0, 3.0)).setLabel("85").scaleRadius(radius_scale);
Atom ATOM_86  = Atom("C", (4.5, 3.5, 3.5)).setLabel("86").scaleRadius(radius_scale);
Atom ATOM_87  = Atom("C", (5.0, 3.0, 4.0)).setLabel("87").scaleRadius(radius_scale);
Atom ATOM_88  = Atom("C", (5.5, 3.5, 4.5)).setLabel("88").scaleRadius(radius_scale);
Atom ATOM_89  = Atom("C", (5.0, 3.0, 2.0)).setLabel("89").scaleRadius(radius_scale);
Atom ATOM_90  = Atom("C", (5.5, 3.5, 2.5)).setLabel("90").scaleRadius(radius_scale);
Atom ATOM_91  = Atom("C", (6.0, 3.0, 3.0)).setLabel("91").scaleRadius(radius_scale);
Atom ATOM_92  = Atom("C", (6.5, 3.5, 3.5)).setLabel("92").scaleRadius(radius_scale);
Atom ATOM_93  = Atom("C", (5.0, 4.0, 3.0)).setLabel("93").scaleRadius(radius_scale);
Atom ATOM_94  = Atom("C", (5.5, 4.5, 3.5)).setLabel("94").scaleRadius(radius_scale);
Atom ATOM_95  = Atom("C", (6.0, 4.0, 4.0)).setLabel("95").scaleRadius(radius_scale);
Atom ATOM_96  = Atom("C", (6.5, 4.5, 4.5)).setLabel("96").scaleRadius(radius_scale);
Atom ATOM_97  = Atom("C", (2.0, 4.0, 2.0)).setLabel("97").scaleRadius(radius_scale);
Atom ATOM_98  = Atom("C", (2.5, 4.5, 2.5)).setLabel("98").scaleRadius(radius_scale);
Atom ATOM_99  = Atom("C", (3.0, 4.0, 3.0)).setLabel("99").scaleRadius(radius_scale);
Atom ATOM_100 = Atom("C", (3.5, 4.5, 3.5)).setLabel("100").scaleRadius(radius_scale);
Atom ATOM_101 = Atom("C", (2.0, 5.0, 3.0)).setLabel("101").scaleRadius(radius_scale);
Atom ATOM_102 = Atom("C", (2.5, 5.5, 3.5)).setLabel("102").scaleRadius(radius_scale);
Atom ATOM_103 = Atom("C", (3.0, 5.0, 4.0)).setLabel("103").scaleRadius(radius_scale);
Atom ATOM_104 = Atom("C", (3.5, 5.5, 4.5)).setLabel("104").scaleRadius(radius_scale);
Atom ATOM_105 = Atom("C", (3.0, 5.0, 2.0)).setLabel("105").scaleRadius(radius_scale);
Atom ATOM_106 = Atom("C", (3.5, 5.5, 2.5)).setLabel("106").scaleRadius(radius_scale);
Atom ATOM_107 = Atom("C", (4.0, 5.0, 3.0)).setLabel("107").scaleRadius(radius_scale);
Atom ATOM_108 = Atom("C", (4.5, 5.5, 3.5)).setLabel("108").scaleRadius(radius_scale);
Atom ATOM_109 = Atom("C", (3.0, 6.0, 3.0)).setLabel("109").scaleRadius(radius_scale);
Atom ATOM_110 = Atom("C", (3.5, 6.5, 3.5)).setLabel("110").scaleRadius(radius_scale);
Atom ATOM_111 = Atom("C", (4.0, 6.0, 4.0)).setLabel("111").scaleRadius(radius_scale);
Atom ATOM_112 = Atom("C", (4.5, 6.5, 4.5)).setLabel("112").scaleRadius(radius_scale);
Atom ATOM_113 = Atom("C", (5.0, 4.0, 5.0)).setLabel("113").scaleRadius(radius_scale);
Atom ATOM_114 = Atom("C", (5.5, 4.5, 5.5)).setLabel("114").scaleRadius(radius_scale);
Atom ATOM_115 = Atom("C", (4.0, 5.0, 5.0)).setLabel("115").scaleRadius(radius_scale);
Atom ATOM_116 = Atom("C", (4.5, 5.5, 5.5)).setLabel("116").scaleRadius(radius_scale);
Atom ATOM_117 = Atom("C", (5.0, 5.0, 6.0)).setLabel("117").scaleRadius(radius_scale);
Atom ATOM_118 = Atom("C", (5.5, 5.5, 6.5)).setLabel("118").scaleRadius(radius_scale);
Atom ATOM_119 = Atom("C", (5.0, 5.0, 4.0)).setLabel("119").scaleRadius(radius_scale);
Atom ATOM_120 = Atom("C", (5.5, 5.5, 4.5)).setLabel("120").scaleRadius(radius_scale);
Atom ATOM_121 = Atom("C", (6.0, 5.0, 5.0)).setLabel("121").scaleRadius(radius_scale);
Atom ATOM_122 = Atom("C", (6.5, 5.5, 5.5)).setLabel("122").scaleRadius(radius_scale);
Atom ATOM_123 = Atom("C", (5.0, 6.0, 5.0)).setLabel("123").scaleRadius(radius_scale);
Atom ATOM_124 = Atom("C", (5.5, 6.5, 5.5)).setLabel("124").scaleRadius(radius_scale);
Atom ATOM_125 = Atom("C", (6.0, 6.0, 6.0)).setLabel("125").scaleRadius(radius_scale);
Atom ATOM_126 = Atom("C", (6.5, 6.5, 6.5)).setLabel("126").scaleRadius(radius_scale);
Atom ATOM_127 = Atom("Si", (4.0, 4.0, 4.0)).setLabel(Label("Si", red)).scaleRadius(radius_scale);

ATOMS
.add(ATOM_1)
.add(ATOM_2)
.add(ATOM_3)
.add(ATOM_4)
.add(ATOM_5)
.add(ATOM_6)
.add(ATOM_7)
.add(ATOM_8)
.add(ATOM_9)
.add(ATOM_10)
.add(ATOM_11)
.add(ATOM_12)
.add(ATOM_13)
.add(ATOM_14)
.add(ATOM_15)
.add(ATOM_16)
.add(ATOM_17)
.add(ATOM_18)
.add(ATOM_19)
.add(ATOM_20)
.add(ATOM_21)
.add(ATOM_22)
.add(ATOM_23)
.add(ATOM_24)
.add(ATOM_25)
.add(ATOM_26)
.add(ATOM_27)
.add(ATOM_28)
.add(ATOM_29)
.add(ATOM_30)
.add(ATOM_31)
.add(ATOM_32)
.add(ATOM_33)
.add(ATOM_34)
.add(ATOM_35)
.add(ATOM_36)
.add(ATOM_37)
.add(ATOM_38)
.add(ATOM_39)
.add(ATOM_40)
.add(ATOM_41)
.add(ATOM_42)
.add(ATOM_43)
.add(ATOM_44)
.add(ATOM_45)
.add(ATOM_46)
.add(ATOM_47)
.add(ATOM_48)
.add(ATOM_49)
.add(ATOM_50)
.add(ATOM_51)
.add(ATOM_52)
.add(ATOM_53)
.add(ATOM_54)
.add(ATOM_55)
.add(ATOM_56)
.add(ATOM_57)
.add(ATOM_58)
.add(ATOM_59)
.add(ATOM_60)
.add(ATOM_61)
.add(ATOM_62)
.add(ATOM_63)
.add(ATOM_64)
.add(ATOM_65)
.add(ATOM_66)
.add(ATOM_67)
.add(ATOM_68)
.add(ATOM_69)
.add(ATOM_70)
.add(ATOM_71)
.add(ATOM_72)
.add(ATOM_73)
.add(ATOM_74)
.add(ATOM_75)
.add(ATOM_76)
.add(ATOM_77)
.add(ATOM_78)
.add(ATOM_79)
.add(ATOM_80)
.add(ATOM_81)
.add(ATOM_82)
.add(ATOM_83)
.add(ATOM_84)
.add(ATOM_85)
.add(ATOM_86)
.add(ATOM_87)
.add(ATOM_88)
.add(ATOM_89)
.add(ATOM_90)
.add(ATOM_91)
.add(ATOM_92)
.add(ATOM_93)
.add(ATOM_94)
.add(ATOM_95)
.add(ATOM_96)
.add(ATOM_97)
.add(ATOM_98)
.add(ATOM_99)
.add(ATOM_100)
.add(ATOM_101)
.add(ATOM_102)
.add(ATOM_103)
.add(ATOM_104)
.add(ATOM_105)
.add(ATOM_106)
.add(ATOM_107)
.add(ATOM_108)
.add(ATOM_109)
.add(ATOM_110)
.add(ATOM_111)
.add(ATOM_112)
.add(ATOM_113)
.add(ATOM_114)
.add(ATOM_115)
.add(ATOM_116)
.add(ATOM_117)
.add(ATOM_118)
.add(ATOM_119)
.add(ATOM_120)
.add(ATOM_121)
.add(ATOM_122)
.add(ATOM_123)
.add(ATOM_124)
.add(ATOM_125)
.add(ATOM_126)
.add(ATOM_127);

ATOMS.drawAtom(draw_label = true);
ATOMS.drawBond("Si", "C", bond_radius = bond_radius, max_dist = max_dist);
//write(ATOMS);



//vim-run: make dist; cd $(dirname %); asy -batchView $(basename %)
//vim-run: asy -f pdf %
