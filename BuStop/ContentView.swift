//
//  ContentView.swift
//  BuStop
//
//  MobileAppProgramming2 Swift TeamProject
//  Team2 : 이윤서, 최명빈, 김동근, 박휘성

import SwiftUI

//MARK: - Start & Finding busStop
struct StartView: View {
    @State var isNavigationBarHidden: Bool = true
    @State var isLoading: Bool = true
    
    var busStopList : [String] = ["133","2dd","3","4","5","6","7","8","9","10","11","12"]

    var body: some View {
        
//        ZStack {
//            // Start Screen
//            if isLoading {
//                launchScreenView
//                    .transition(.opacity)
//            }
//        }
//        .onAppear {
//            DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
//                withAnimation { isLoading.toggle() }
//            })
//        }
        
        NavigationView {
            ZStack {
                Color(red: 213/255, green: 223/255, blue: 240/255).ignoresSafeArea()
                ZStack {
                    VStack {
                        ZStack {
                            Text("현재 위치의 주변 정류장입니다. \n 탑승하실 곳을 선택하세요.")
                                .font(.title3)
                                .multilineTextAlignment(.center)
                                .padding(.leading, 50.0)
                                .padding(.top, 50.0)
                            Spacer()
                            HStack {
                                Image("CurrentStop")
                                    .resizable()
                                    .frame(width: 80, height: 80)
                                Spacer()
                            }
                            .padding(.top, 40.0)
                            .padding(.leading, 10.0)

                        }
                        Spacer()
                    }

                    ZStack {
                        RoundedRectangle(cornerRadius: 35.0)
                            .padding(.top, 150.0)
                            .padding(.horizontal, 20.0)
                            .foregroundColor(.white)
                        ZStack {
                            ScrollView(.vertical, showsIndicators: false, content: {
                                VStack (alignment: .leading){
                                    ForEach(busStopList, id:\.self, content: { item in
                                        BusStopListItemView(busStopName: item)
                                    })
                                }
                            })
                            .frame(width: 300, height: 550, alignment: .leading)
                            .padding(.top, 170.0)
                            .padding(.horizontal, 20.0)

                            NavigationLink("next", destination: SelectBusView(isNavigationBarHidden: self.$isNavigationBarHidden))
                                .padding(.horizontal, 40.0)
                            
                        }
                    }
                    
                }
            }
            .navigationBarTitle("")
            .navigationBarHidden(self.isNavigationBarHidden)
            .onAppear {
                self.isNavigationBarHidden = true
            }
        }
    }
}






//MARK: - Select Bus
struct SelectBusView: View {
    @Binding var isNavigationBarHidden: Bool
    
    var busList : [String] = ["111","222","333","444","555"]

    var body: some View {
        ZStack {
            Color(red: 213/255, green: 223/255, blue: 240/255).ignoresSafeArea()
            ZStack {
                VStack {
                    ZStack {
                        Text("선택하신 정류장은\n여기 입니다.\n탑승할 버스를 선택하세요.")
                            .font(.title2)
                            .multilineTextAlignment(.center)
                            .padding(.top, 35.0)
                        Spacer()
                    }
                    Spacer()
                }

                ZStack {
                    RoundedRectangle(cornerRadius: 35.0)
                        .padding(.top, 150.0)
                        .padding(.horizontal, 20.0)
                        .foregroundColor(.white)
                    Image("ComingBus")
                        .resizable()
                        .frame(width: 250, height: 250)
                        .padding(.bottom, 60.0)
                    ZStack {          
                        ScrollView(.vertical, showsIndicators: false, content: {
                            LazyVGrid(columns:[GridItem(.adaptive(minimum: 100))]) {
                                ForEach(busList, id:\.self, content: { item in
                                    BusListItemView(busName: item)
                                        .aspectRatio(3/2, contentMode: .fit)
                                })
                            }
                        })
                        .frame(width: 300, height: 200, alignment: .leading)
                        .padding(.top, 500.0)
                        .padding(.horizontal, 40.0)

                    }
                }
            }
            NavigationLink("next", destination: GoalView(isNavigationBarHidden: self.$isNavigationBarHidden))
                .padding(.horizontal, 40.0)
            
        }
        .navigationBarTitle("")
        .navigationBarHidden(self.isNavigationBarHidden)
        .onAppear {
            self.isNavigationBarHidden = true
        }
    }
}


//MARK: - Select Goal
struct GoalView: View {
    @Binding var isNavigationBarHidden: Bool
    
    var busGoalList : [String] = ["복현우체국","복현오거리1","333","444","555"]
    var body: some View {
        ZStack {
            Color(red: 213/255, green: 223/255, blue: 240/255).ignoresSafeArea()
            ZStack {
                VStack {
                    Text("선택하신 버스는\n() 입니다. \n 목적지를 선택하세요.")
                        .font(.title2)
                        .multilineTextAlignment(.center)
                        .padding(.top, 30.0)
                    Spacer()
                }

                ZStack {
                    RoundedRectangle(cornerRadius: 35.0)
                        .padding(.top, 150.0)
                        .padding(.horizontal, 20.0)
                        .foregroundColor(.white)
                    HStack {
                        ScrollView(.vertical, showsIndicators: false, content: {
                            VStack (alignment: .leading) {
                                ForEach(busGoalList, id:\.self, content: { item in
                                    BusGoalItemView(busGoalName: item)
                                })
                            }
                        })
                        .frame(width: 300, height: 550, alignment: .leading)
                        .padding(.top, 170.0)
                    }
                
                }
            }
        }
        .navigationBarTitle("")
        .navigationBarHidden(self.isNavigationBarHidden)
        .onAppear {
            self.isNavigationBarHidden = true
        }
    }
}








//MARK: - ETC

//extension StartView {
//    var launchScreenView: some View {
//        ZStack (alignment: .center) {
//            Color(.white).edgesIgnoringSafeArea(.all)
//
//            Image("LaunchIcon")
//        }
//        
//        
//    }
//}

struct BusStopListItemView: View {
    var busStopName: String
    var selected: Bool = false
    
    var body: some View {
        HStack {
            Image("BusStop")
                .resizable()
                .frame(width: 50, height: 50)
            Text(busStopName)
                .font(.largeTitle)
        }
    }
}

struct BusListItemView: View {
    var busName: String
    let shape = RoundedRectangle(cornerRadius: 20)
    var body: some View {
        ZStack {
            shape.fill().foregroundColor(.white)
            shape.strokeBorder(lineWidth: 3).foregroundColor(Color(red: 213/255, green: 223/255, blue: 240/255))
            Text(busName)
                .font(.title)
        }
    }
}


struct BusGoalItemView: View {
    var busGoalName: String
    var shape = Rectangle()
    var body: some View {
        HStack {
            shape
                .foregroundColor(Color(red: 213/255, green: 223/255, blue: 240/255))
                .frame(width:20, height: 50)
            Text(busGoalName)
                .font(.title)
        }
    }
}









struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
    }
}
