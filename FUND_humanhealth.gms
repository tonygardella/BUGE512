*FUND Class Project  - Human Health and Morbidity/Mortality
*Author: Kevin Zheng
*Last Edit: 04/01/2015


sets
         t time periods /
         2010, 2015, 2020, 2025, 2030, 2035, 2040, 2045, 2050, 2055, 2060,
         2065, 2070, 2075, 2080, 2085, 2090, 2095, 2100/

* 2105, 2110, 2115, 2120, 2125, 2130, 2135, 2140, 2145, 2150, 2155, 2160, 2165, 2170, 2175, 2180, 2185, 2190, 2195, 2200

         r regions /
         USA, CAN, WEU, JPK, ANZ, CEE, FSU, MDE, CAM, SAM, SAS, SEA, CHI,
         NAF, SSA, SIS
         /

         c countries /
         UnitedStatesofAmerica, Canada, Andorra, Austria, Belgium, Cyprus,
         Denmark, Finland, France, Germany, Greece, Iceland, Ireland,
         Italy, Liechtenstein, Luxembourg, Malta, Monaco, Netherlands,
         Norway, Portugal, SanMarino, Spain, Sweden, Switzerland,
         UnitedKingdom, Japan, SouthKorea, Australia, NewZealand, Albania,
         BosniaHerzegovina, Bulgaria, Croatia, CzechRepublic, Hungary,
         Macedonia, Poland, Romania, Slovakia, Slovenia, Yugoslavia,
         Armenia, Azerbaijan, Belarus, Estonia, Georgia, Kazakhstan,
         Kyrgyzstan, Latvia, Lithuania, Moldova, Russia, Tajikistan,
         Turkmenistan, Ukraine, Uzbekistan, Bahrain, Iran, Iraq, Israel,
         Jordan, Kuwait, Lebanon, Oman, Qatar, SaudiArabia, Syria, Turkey,
         UnitedArabEmirates, Gaza, Yemen, Belize, CostaRica, ElSalvador,
         Guatemala, Honduras, Mexico, Nicaragua, Panama, Argentina,
         Bolivia, Brazil, Chile, Colombia, Ecuador, FrenchGuiana, Guyana,
         Paraguay, Peru, Suriname, Uruguay, Venezuela, Afghanistan,
         Bangladesh, Bhutan, India, Nepal, Pakistan, SriLanka, Brunei,
         Cambodia, EastTimor, Indonesia, Laos, Malaysia, Myanmar,
         PapuaNewGuinea, Philippines, Singapore, Taiwan, Thailand,
         Vietnam, China, HongKong, NorthKorea, Macau, Mongolia, Algeria,
         Egypt, Libya, Morocco, Tunisia, WesternSahara, Angola, Benin,
         Botswana, BurkinaFaso, Burundi, Cameroon, CapeVerde,
         CentralAfricanRepublic, Chad, Congo-Brazzaville, Congo-Kinshasa,
         CotedIvoire, Djibouti, EquatorialGuinea, Eritrea, Ethiopia,
         Gabon, Gambia, Ghana, Guinea, Guinea-Bissau, Kenya, Lesotho,
         Liberia, Madagascar, Malawi, Mali, Mauritania, Mozambique,
         Namibia, Niger, Nigeria, Rwanda, Senegal, SierraLeone, Somalia,
         SouthAfrica, Sudan, Swaziland, Tanzania, Togo, Uganda, Zambia,
         Zimbabwe, Antigua-Barbuda, Aruba, Bahamas, Barbados, Bermuda,
         Comoros, Cuba, Dominica, DominicanRepublic, Fiji,
         FrenchPolynesia, Grenada, Guadeloupe, Haiti, Jamaica, Kiribati,
         Maldives, MarshallIslands, Martinique, Mauritius, Micronesia,
         Nauru, NetherlandsAntilles, NewCaledonia, Palau, PuertoRico,
         Reunion, Samoa, SaoTome-Principe, Seychelles, SolomonIslands,
         StKitts-Nevis, StLucia, StVincent-Grenadines, Tonga,
         Trinidad-Tobago, Tuvalu, Vanuatu, VirginIslands
         /

         rcmap(*,*) regional map /
         USA.(UnitedStatesofAmerica)
         CAN.(Canada)
         WEU.(Andorra, Austria, Belgium, Cyprus, Denmark, Finland, France,
              Germany, Greece, Iceland, Ireland, Italy, Liechtenstein,
              Luxembourg, Malta, Monaco, Netherlands, Norway, Portugal,
              SanMarino, Spain, Sweden, Switzerland, UnitedKingdom)
         JPK.(Japan, SouthKorea)
         ANZ.(Australia, NewZealand)
         CEE.(Albania, BosniaHerzegovina, Bulgaria, Croatia,
              CzechRepublic, Hungary, Macedonia, Poland, Romania,
              Slovakia, Slovenia, Yugoslavia)
         FSU.(Armenia, Azerbaijan, Belarus, Estonia, Georgia, Kazakhstan,
              Kyrgyzstan, Latvia, Lithuania, Moldova, Russia, Tajikistan,
              Turkmenistan, Ukraine, Uzbekistan)
         MDE.(Bahrain, Iran, Iraq, Israel, Jordan, Kuwait, Lebanon, Oman,
              Qatar, SaudiArabia, Syria, Turkey, UnitedArabEmirates, Gaza,
              Yemen)
         CAM.(Belize, CostaRica, ElSalvador, Guatemala, Honduras, Mexico,
              Nicaragua, Panama)
         SAM.(Argentina, Bolivia, Brazil, Chile, Colombia, Ecuador,
              FrenchGuiana, Guyana, Paraguay, Peru, Suriname, Uruguay,
              Venezuela)
         SAS.(Afghanistan, Bangladesh, Bhutan, India, Nepal, Pakistan,
              SriLanka)
         SEA.(Brunei, Cambodia, EastTimor, Indonesia, Laos, Malaysia,
              Myanmar, PapuaNewGuinea, Philippines, Singapore, Taiwan,
              Thailand, Vietnam)
         CHI.(China, HongKong, NorthKorea, Macau, Mongolia)
         NAF.(Algeria, Egypt, Libya, Morocco, Tunisia, WesternSahara)
         SSA.(Angola, Benin, Botswana, BurkinaFaso, Burundi, Cameroon,
              CapeVerde, CentralAfricanRepublic, Chad, Congo-Brazzaville,
              Congo-Kinshasa, CotedIvoire, Djibouti, EquatorialGuinea,
              Eritrea, Ethiopia, Gabon, Gambia, Ghana, Guinea,
              Guinea-Bissau, Kenya, Lesotho, Liberia, Madagascar, Malawi,
              Mali, Mauritania, Mozambique, Namibia, Niger, Nigeria,
              Rwanda, Senegal, SierraLeone, Somalia, SouthAfrica, Sudan,
              Swaziland, Tanzania, Togo, Uganda, Zambia, Zimbabwe)
         SIS.(Antigua-Barbuda, Aruba, Bahamas, Barbados, Bermuda, Comoros,
              Cuba, Dominica, DominicanRepublic, Fiji, FrenchPolynesia,
              Grenada, Guadeloupe, Haiti, Jamaica, Kiribati, Maldives,
              MarshallIslands, Martinique, Mauritius, Micronesia, Nauru,
              NetherlandsAntilles, NewCaledonia, Palau, PuertoRico,
              Reunion, Samoa, SaoTome-Principe, Seychelles,
              SolomonIslands, StKitts-Nevis, StLucia,
              StVincent-Grenadines, Tonga, Trinidad-Tobago, Tuvalu,
              Vanuatu, VirginIslands)
         /;

parameters
         temp(t) global mean temperature /
                  2010        11.6989
                  2015        11.8373
                  2020        12.1969
                  2025        12.3194
                  2030        12.2645
                  2035        12.2202
                  2040        12.5091
                  2045        12.572
                  2050        12.5642
                  2055        12.8808
                  2060        12.9086
                  2065        13.1473
                  2070        13.2911
                  2075        13.1729
                  2080        13.1218
                  2085        13.3003
                  2090        13.7775
                  2095        13.4196
                  2100        13.338     /
         preindustrial_temp degrees C based on scenario 42 /10.9985/
         reg_temp(t,r) regional mean temperature
         deaths_diarrhea(t,r) deaths due to diarrhea
         deaths_vector total deaths due to vector borne diseases
         deaths_vector_malaria (t,r) deaths due to malaria
         deaths_vector_dengue (t,r) deaths due to dengue fever
         deaths_vector_schis (t,r) deaths due to schistosomiasis
         value_life(t,r) value of a statisical life
         value_year_morb(t,r) value of a year of morbidity
         change_cardio_res_hot_over65(t,r) climate induced mortality per 100000
         change_cardio_res_hot_under65(t,r)
         change_cardio_res_cold_over65(t,r)
         change_cardio_res_cold_under65(t,r)
         deaths_cardio_res_heat(t,r) deaths due to heat related cardio-respiratory
         deaths_cardio_res_cold(t,r) deaths due to cold related cardio-respiratory
         total_loss_health(t,r) total $ lost due to deaths from climate change

         global_param_health(*)  Tol parameters /
                 "income_elas_diarrhea_mort"               -1.58
                 "diarrhea_mort_response_warming"           1.14
                 "deg_nonlinearity_mortality_in_warming"    1.00
                 "income_elas_vector_mort"                 -2.65
                 "mort_morb_no_description_1"               4992523
                 "mort_morb_no_description_2"               4992523
                 "normalization_constant"                   24963
                 "income_elas_value_of_life"                1.00
                 "income_elas_value_of_year_morb"           1.00
                 "malaria_param"                            0.0794
                 "dengue_param"                             0.3534
                 "schis_param"                             -0.1149
         /;

         table Y_pc(t,r) GDP per capita (USD$) need to pull from econ model
            USA          CAN          WEU           JPK          ANZ        CEE        FSU          MDE          CAM          SAM          SAS          SEA          CHI        NAF            SSA          SIS
2010        48377        47465        118691        65269        30000      30000      30000        30000        30000        30000        30000        30000        30000        30000        30000        30000
2015        56275        51068        129691        82105        30000      30000      30000        30000        30000        30000        30000        30000        30000        30000        30000        30000
2020        65246        48909        151832        104460       40000      40000      40000        40000        40000        40000        40000        40000        40000        40000        40000        40000
2025        75646        46842        181475        133196       40000      40000      40000        40000        40000        40000        40000        40000        40000        40000        40000        40000
2030        87705        44862        220117        170223       50000      50000      50000        50000        50000        50000        50000        50000        50000        50000        50000        50000
2035        101686       42965        269697        218042       50000      50000      50000        50000        50000        50000        50000        50000        50000        50000        50000        50000
2040        117895       41149        332699        279947       60000      60000      60000        60000        60000        60000        60000        60000        60000        60000        60000        60000
2045        136689       39409        412276        360271       60000      60000      60000        60000        60000        60000        60000        60000        60000        60000        60000        60000
2050        158478       37743        512406        464734       70000      70000      70000        70000        70000        70000        70000        70000        70000        70000        70000        70000
2055        183741       36147        638093        600895       70000      70000      70000        70000        70000        70000        70000        70000        70000        70000        70000        70000
2060        213031       34619        795614        778762       80000      80000      80000        80000        80000        80000        80000        80000        80000        80000        80000        80000
2065        246990       33156        992836        1011606      80000      80000      80000        80000        80000        80000        80000        80000        80000        80000        80000        80000
2070        286362       31754        1239606       1317053      90000      90000      90000        90000        90000        90000        90000        90000        90000        90000        90000        90000
2075        332011       30412        1548244       1718542      90000      90000      90000        90000        90000        90000        90000        90000        90000        90000        90000        90000
2080        384936       29126        1934158       2247284      100000     100000     100000       100000       100000       100000       100000       100000       100000       100000       100000       100000
2085        446298       27895        2416614       2944896      100000     100000     100000       100000       100000       100000       100000       100000       100000       100000       100000       100000
2090        517442       26715        3019697       3866924      110000     110000     110000       110000       110000       110000       110000       110000       110000       110000       110000       110000
2095        000027       25586        3773510       5087596      110000     110000     110000       110000       110000       110000       110000       110000       110000       110000       110000       110000
2100        695560       24504        4715686       6706197      120000     120000     120000       120000       120000       120000       120000       120000       120000       120000       120000       120000
         ;

         table population(t,r)  in thousands UN medium forecast incomplete aggregation
            USA           CAN          WEU          JPK           ANZ          CEE          FSU          MDE           CAM          SAM           SAS           SEA          CHI            NAF           SSA          SIS
2010        312247        34126        19421        175807        26773        14385        21549        106676        11196        245741        180240        15845        1391371        121179        31028        549
2015        325128        35871        19822        176568        28519        14129        21862        116603        11775        256837        193194        17278        1434055        131656        35756        583
2020        337983        37612        20164        176151        30254        13859        22048        126328        12296        266850        206055        18687        1466183        141659        40969        612
2025        350626        39185        20482        174858        31941        13561        22072        135527        12732        275743        218319        20015        1483032        150615        46583        638
2030        362629        40617        20758        172815        33544        13224        21933        143945        13096        283273        229461        21198        1487901        158574        52638        660
2035        373468        41885        20988        170088        35072        12834        21702        152019        13368        289338        239287        22312        1483531        165899        59028        678
2040        383165        43042        21185        166787        36565        12403        21420        159780        13557        293934        247645        23375        1470589        172789        65647        693
2045        392111        44144        21357        163139        38048        11954        21069        167105        13665        297071        254392        24354        1449214        179145        72403        703
2050        400853        45228        21505        159364        39513        11503        20633        173769        13691        298764        259479        25202        1420056        184670        79241        712
2055        409370        46212        21609        155502        40864        11062        20129        179583        13652        299081        263114        25917        1385392        189160        86104        719
2060        417764        47114        21691        151465        42093        10634        19597        184485        13550        298101        265322        26506        1348011        192596        92874        723
2065        425909        47941        21777        147237        43211        10217        19061        188480        13393        295927        266107        26971        1310766        195127        99432        726
2070        433489        48693        21881        142973        44231        9815         18534        191631        13187        292728        265456        27317        1274735        196939        105690       727
2075        440248        49349        21994        138932        45147        9435         18020        194106        12937        288721        263457        27543        1239594        198217        111558       727
2080        446113        49896        22099        135386        45944        9086         17538        196097        12653        284127        260306        27659        1206478        199074        116984       724
2085        451196        50329        22181        132306        46597        8777         17106        197854        12351        279218        256314        27649        1178482        199530        121905       720
2090        455588        50644        22242        129618        47106        8515         16727        199519        12055        274229        251800        27592        1156166        199497        126277       715
2095        459254        50834        22273        127214        47473        8298         16383        201033        11785        269281        247082        27486        1136758        198879        130073       710
2100        462070        50882        22272        125019        47684        8124         16056        202163        11551        264479        242357        27354        1117507        197726        133306       704
         ;

table regional_param_health(r,*) mort rates are placeholders
$ondelim onlisting
$include 'regional_health.csv'
$offdelim offlisting
;

loop(t,

reg_temp(t,r) = temp(t) * regional_param_health(r,"reg_temp_conversion");

*DIARRHOEA

deaths_diarrhea(t,r) = regional_param_health(r,"mort_rate_diarrhea") *
         population(t,r) * (Y_pc(t,r) / Y_pc("2010",r))**
         global_param_health("income_elas_diarrhea_mort") *
         (reg_temp(t,r) * regional_param_health(r,"reg_temp_conversion")) /
         preindustrial_temp**
         global_param_health("diarrhea_mort_response_warming");

*VECTOR BORNE

deaths_vector_malaria(t,r) = regional_param_health(r,"mort_rate_vec_malaria")
         * global_param_health("malaria_param") *
         (reg_temp(t,r) - preindustrial_temp)**
         global_param_health("deg_nonlinearity_mortality_in_warming") *
         (Y_pc(t,r) / Y_pc("2010",r))**
         global_param_health("income_elas_vector_mort");

deaths_vector_dengue(t,r) = regional_param_health(r,"mort_rate_vec_dengue")
         * global_param_health("dengue_param") *
         (reg_temp(t,r) - preindustrial_temp)**
         global_param_health("deg_nonlinearity_mortality_in_warming") *
         (Y_pc(t,r) / Y_pc("2010", r))**
         global_param_health("income_elas_vector_mort");

deaths_vector_schis(t,r) = regional_param_health(r,"mort_rate_vec_schis")
         * global_param_health("schis_param") *
         (reg_temp(t,r) - preindustrial_temp)**
         global_param_health("deg_nonlinearity_mortality_in_warming") *
         (Y_pc(t,r) / Y_pc("2010",r))**
         global_param_health("income_elas_vector_mort");

deaths_vector(t,r) = (deaths_vector_malaria(t,r)+deaths_vector_dengue(t,r)+
         deaths_vector_schis(t,r)) * population(t,r) / 1000000;


*MORBIDITY AND MORTALITY

value_life(t,r) = global_param_health("mort_morb_no_description_1") *
         (Y_pc(t,r) / global_param_health("normalization_constant"))**
         global_param_health("income_elas_value_of_life");

value_year_morb(t,r) = global_param_health("mort_morb_no_description_2") *
         (Y_pc(t,r) / global_param_health("normalization_constant"))**
         global_param_health("income_elas_value_of_year_morb");

*CARDIOVASCULAR AND RESPIRATORY

change_cardio_res_hot_over65(t,r) = regional_param_health(r,"heat_over65_1") *
         (reg_temp(t,r) - preindustrial_temp) +
         regional_param_health(r,"heat_over65_2") *
         (reg_temp(t,r) - preindustrial_temp)**2;

change_cardio_res_hot_under65(t,r) = regional_param_health(r,"heat_under65_1") *
         (reg_temp(t,r) - preindustrial_temp) +
         regional_param_health(r,"heat_under65_2") *
         (reg_temp(t,r) - preindustrial_temp)**2;

deaths_cardio_res_heat(t,r) = (change_cardio_res_hot_over65(t,r) +
         change_cardio_res_hot_under65(t,r)) * population(t,r) / 100000 ;

change_cardio_res_cold_over65(t,r) = regional_param_health(r,"cold_over65_1") *
         (reg_temp(t,r) - preindustrial_temp) +
         regional_param_health(r,"cold_over65_2") *
         (reg_temp(t,r) - preindustrial_temp)**2;

change_cardio_res_cold_under65(t,r) = regional_param_health(r,"cold_under65_1") *
         (reg_temp(t,r) - preindustrial_temp) +
         regional_param_health(r,"cold_under65_2") *
         (reg_temp(t,r) - preindustrial_temp)**2;

deaths_cardio_res_cold(t,r) = (change_cardio_res_cold_over65(t,r) +
         change_cardio_res_cold_under65(t,r)) * population(t,r) / 100000 ;

*TOTAL VALUE $ LOST DUE TO CLIMATE CHANGE

total_loss_health(t,r) = (deaths_diarrhea(t,r) + deaths_vector(t,r) +
         deaths_cardio_res_heat(t,r) + deaths_cardio_res_cold(t,r)) *
         value_life(t,r);
*currently negative because of proxy values causing climate-induced mortality
*from cold related cardio-respiratory diseases to decrease more than the other
*deaths would increase . Missing/unsure how to incorporate urban factor from
*equation HC.3

);

display total_loss_health;
display reg_temp;
display deaths_diarrhea;
display deaths_vector;
display value_life;
display deaths_cardio_res_heat;
display deaths_cardio_res_cold;
