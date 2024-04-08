Config = {}

Config.target = "qb"       -- "qb" or "bt" for your target script

Config.CallCops = "true"   -- True or False, do you want police to be notified when a vehicle is being chopped.

Config.CoolDown = 120       -- How long people must wait before starting another job (in minutes)

Config.StartLoc = vector4(-552.0936, -1792.5475, 22.3643, 67.7999)  -- Starting Location with target and PED


Config.WheelItems = {      -- Items you get when chopping a wheel
    [1] = {
        ["item"] = "iron",
        ["amount"] = math.random(40, 65)
    },
    [2] = {
        ["item"] = "copper",
        ["amount"] = math.random(40, 65)
    },
    [3] = {
        ["item"] = "rubber",
        ["amount"] = math.random(40, 65)
    },
}

Config.DoorItems = {    -- Items you get when chopping a door (also includes the trunk and hood)
    [1] = {
        ["item"] = "steel",
        ["amount"] = math.random(80, 150)
    },
    [2] = {
        ["item"] = "copper",
        ["amount"] = math.random(80, 150)
    },
    [3] = {
        ["item"] = "metalscrap",
        ["amount"] = math.random(80, 150)
    },
    [4] = {
        ["item"] = "iron",
        ["amount"] = math.random(80, 150)
    },
    [5] = {
        ["item"] = "glass",
        ["amount"] = math.random(80, 150)
    },
}

Config.TrunkItems = {      -- Items that players can find in the trunk of the vehicle
    [1] = {
        ["item"] = "advancedlockpick",
        ["amount"] = math.random(1, 2)
    },
    [2] = {
        ["item"] = "joint",
        ["amount"] = math.random(5, 8)
    },
    [3] = {
        ["item"] = "PistolSlideAssembly",
        ["amount"] = 1,
    },
}

Config.DeliveryCoords = {  -- Locations for the scrapyards
    [1] = {
        x = 2055.7080,     
        y =  3179.8103,
        z = 45.1689,   
        h = 91.500389,
    },
    [2] = {
        x = 2351.7979,
        y = 3132.7310,
        z = 47.6015,    
        h = 91.500389,
    },
    [3] = {
        x = 1565.4553,  
        y = -2158.8508,
        z = 76.9222,    
        h = 91.500389,
    },
    [4] = {
        x = -458.0591,  
        y = -1712.9053,
        z = 18.0516, 
        h = 91.500389,
    },
}

Config.VehicleList =  {       -- All the different types of vehicles that can spawn.
    [1]  = {vehicle = "tracer93"},
    [2]  = {vehicle = "towncar98"},
    [3]  = {vehicle = "voyager96"},
    [4]  = {vehicle = "xj690"},
    [5]  = {vehicle = "535i97"},
    [6]  = {vehicle = "impala99"},
    [7]  = {vehicle = "impala01"},
    [8]  = {vehicle = "escalade02"},
    [9]  = {vehicle = "durango96"},
    [10] = {vehicle = "deville95"},
    [11] = {vehicle = "cv94"},
    [12] = {vehicle = "cv96"},
    [13] = {vehicle = "cv98"},
    [14] = {vehicle = "cv91"},
    [15] = {vehicle = "accord86"},
    [16] = {vehicle = "cv92"},
    [17] = {vehicle = "civic96"},
    [18] = {vehicle = "850sw"},
    [19] = {vehicle = "ferio"},
    [20] = {vehicle = "sierra88"},
    [21] = {vehicle = "sabregt"},
    [22] = {vehicle = "solaris"},
    [23] = {vehicle = "honody"},
    [24] = {vehicle = "lotelise190"},
    [25] = {vehicle = "bmwm5e39"},
    [26] = {vehicle = "Superd"},
    [27] = {vehicle = "04mpv"},
    [28] = {vehicle = "newyorker82"},
    [29] = {vehicle = "Jackal"},
    [30] = {vehicle = "kingfish"},
    [31] = {vehicle = "cullinan"},
    [32] = {vehicle = "Dilettante"},
    [33] = {vehicle = "subwrx"},
    [34] = {vehicle = "Blista2"},
    [35] = {vehicle = "Zion"},
    [36] = {vehicle = "Zion2"},
    [37] = {vehicle = "Feltzer2"},
    [38] = {vehicle = "Sultanrs"},
    [39] = {vehicle = "Fusilade"},
    [40] = {vehicle = "Jester"},
    [41] = {vehicle = "Carbonizzare"},
    [42] = {vehicle = "Sultan"},
    [43] = {vehicle = "Peyote"},
    [44] = {vehicle = "Buccaneer2"},
    [45] = {vehicle = "Picador"},
    [46] = {vehicle = "Virgo2"},
    [47] = {vehicle = "Brawler"},
}

Config.VehicleCoords = {        -- Locations of where the vehicle can spawn
    [1] = {x =  -114.9003, y = -2526.6394, z = 5.3918, h = 235.8066 },       
    [2] = {x = -115.1422, y = -2526.6729, z = 5.3931, h = 236.1575}, 
    [3] = {x = -1074.953,y = -1160.545,z = 1.661577, h = 119.0},
    [4] = {x = -1023.625,y = -890.4014,z = 5.202, h = 216.0399},
    [5] = {x = -1609.647,y = -382.792,z = 42.70383, h = 52.535},
    [6] = {x = -1527.88,y = -309.8757,z = 47.88678, h= 323.43},
    [7] = {x = -1658.969,y = -205.1732,z = 54.8448,h = 71.138},
    [8] = {x = 97.57888,y = -1946.472,z = 20.27978,h = 215.933},
    [9] = {x = -61.59007,y = -1844.621,z = 26.1685,h = 138.9848},
    [10] = {x = 28.51439,y = -1734.881,z = 28.5415,h = 231.968},
    [11] = {x = 437.5428,y = -1925.465,z = 24.004,h = 28.82286},
    [12] = {x = 406.5316,y = -1920.471,z = 24.51589,h = 224.6432},
    [13] = {x = 438.4482,y = -1838.672,z = 27.47369,h = 42.8129   },
    [14] = {x = 187.353,y = -1542.984,z = 28.72487,h = 39.00627},
    [15] = {x = 1153.467,y = -330.2682,z = 68.60548,h = 7.20},
    [16] = {x = 1144.622,y = -465.7694,z = 66.20689,h = 76.612770},
    [17] = {x = 1295.844,y = -567.6,z = 70.77858,h = 166.552},
    [18] = {x = 1319.566,y = -575.9492,z = 72.58221,h = 155.9249},
    [19] = {x = 1379.466,y = -596.0999,z = 73.89736,h = 230.594},
    [20] = {x = 1256.648,y = -624.0594,z = 68.93141,h = 117.415},
    [21] = {x = 1368.127,y = -748.2613,z = 66.62316,h = 231.535},
    [22] = {x = 981.7167, y = -709.7389, z = 57.18427, h = 128.729},
    [23] = {x = 958.206,y = -662.7545,z = 57.57119,h = 116.9299},
    [24] = {x = -2012.404,y = 484.0458,z = 106.5597,h = 78.13},
    [25] = {x = -2001.294,y = 454.7647,z = 102.0194,h = 108.1178},
    [26] = {x = -1994.725,y = 377.4933,z = 94.04324,h = 89.64067},
    [27] = {x = -1967.549,y = 262.1507,z = 86.23506,h = 109.1846},
    [28] = {x = -989.6796,y = 418.4977,z = 74.731,h = 20.262},
    [29] = {x = -979.6517,y = 518.119,z = 81.03075,h = 328.386},
    [30] = {x = -1040.915,y = 496.5622,z = 82.52803,h = 54.439},
    [31] = {x = -1094.621,y = 439.2605,z = 74.84596,h = 84.936},
    [32] = {x = -1236.895,y = 487.9722,z = 92.82943,h = 330.6634},
    [33] = {x = -1209.098,y = 557.9588,z = 99.04235,h = 3.2526},
    [34] = {x = -1155.296,y = 565.4297,z = 101.3919,h = 7.4106},
    [35] = {x = -1105.378,y = 551.5797,z = 102.1759,h = 211.7110},
    [36] = {x = 1708.02,y = 3775.486,z = 34.08183,h = 35.04580},
    [37] = {x = 2113.365,y = 4770.113,z = 40.72895,h = 297.5323},
    [38] = {x = 2865.448,y = 1512.715,z = 24.12726,h = 252.3262},
    [39] = {x = 1413.973,y = 1119.024,z = 114.3981,h = 305.99868},
    [40] = {x = -78.39651,y = 497.4749,z = 143.9646,h = 160.2948},
    [41] = {x = -248.9841,y = 492.9105,z = 125.0711,h = 208.5761},
    [42] = {x = 14.09792,y = 548.8402,z = 175.7571,h = 241.4019775},
    [43] = {x = 51.48445,y = 562.2509,z = 179.8492,h = 203.159},
    [44] = {x = -319.3912,y = 478.9731,z = 111.7186,h = 298.7645},
    [45] = {x = -202.0035,y = 410.2064,z = 110.0086,h = 195.6136},
    [46] = {x = -187.1009, y = 379.9514, z = 108.0138, h = 176.9462},
    [47] = {x = 213.5159, y = 389.3123, z = 106.4154, h = 348.890255},
    [48] = {x = 323.7256, y = 343.3308, z = 104.761, h = 345.49426},
    [49] = {x = 701.1197, y = 254.4424, z = 92.85217, h = 240.62884},
    [50] = {x = 656.4758, y = 184.8482, z = 94.53828, h = 248.9376},
    [51] = {x = 615.5524, y = 161.4801, z = 96.91451, h = 69.2577},
    [52] = {x = 899.2693, y = -41.99047, z = 78.32366, h = 28.13086},
    [53] = {x = 873.3314, y = 9.008331, z = 78.32432, h = 329.343},
    [54] = {x = 941.2477, y = -248.0161, z = 68.15629, h = 328.122},
    [55] = {x = 842.7501, y = -191.9954, z = 72.1975, h = 329.2124},
    [56] = {x = 534.3583, y = -26.7027, z = 70.18916, h = 30.70978},
    [57] = {x = 302.5077, y = -176.5727, z = 56.95071, h = 249.3339},
    [58] = {x = 85.26346, y = -214.7179, z = 54.05132, h = 160.2142},
    [59] = {x = 78.38569, y = -198.4182, z = 55.79539, h = 70.1377},
    [60] = {x = -30.09893, y = -89.37914, z = 56.8136, h = 340.32879},
}

-- All Text used in the script (you can change any of the text you want)
Config.Locale = {
    -- Notifications
    ["Reminder"] 			= "Remove parts from the vehicle then get back into it to to crush it!",
	["FarAway"] 			= "You are to far away from the vehicle. It has been sent to the crusher!",
    ["CoolDown"]            = "There is currently no new jobs, please come back later!",
    ["JobActive"]           = "You have not yet completed the active job!",
    ["Email"]               = "I will send information to your email.",
    ["WrongVeh"]            = "This Is not the correct Vehicle",
    ["FoundVeh"]            = "Nice, You found the right car!",
    ["ScrapBlip"]           = "Sending scrapyard location to your GPS...",


    -- Draw Text
    ["chop"] 			    = "~g~E~w~ - Start Chopping",
	["remove"] 				= "~g~E~w~ - Remove the ",
	["destroy"] 			= "~g~E~w~ - Destroy car ",
    ["reqjob"] 			    = "~g~E~w~ - Request Vehicle Information.",
	["Trunk"]				= "Trunk",				
	["Hood"]				= "Hood",				
	["Frontleftdoor"]		= "front left door",	
	["Backleftdoor"]		= "back left door",		
	["Frontrightdoor"]		= "front right door",	
	["Backrightdoor"]		= "back right door",	
	["Frontleftwheel"]		= "front left wheel",	
	["Backleftwheel"]		= "back left wheel",	
	["Rightfrontwheel"]		= "front right wheel",	
	["Rightbackwheel"]		= "back right wheel",	

    -- Progress Bars
    ["Wheel"] 				= "Removing The Wheel...",
	["Door1"] 		        = "Loosening Bolts...",
	["Door2"] 		        = "Pulling From Hinges..",
	["crushing"] 			= "Sending car for crushing",
    ["searching"]           = "Looting Trunk...",

    ["chopwheel"]           = "Cutting Down the wheel..",
    ["chopdoor"]           = "Cutting Down the door..",
    ["choptrunk"]           = "Cutting Down the trunk..",
    ["chophood"]           = "Cutting Down the hood..",
}