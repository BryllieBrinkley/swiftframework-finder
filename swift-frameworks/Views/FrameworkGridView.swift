//
//  FrameworkGridView.swift
//  swift-frameworks
//
//  Created by Jibryll Brinkley on 12/13/24.
//
import SwiftUI

struct FrameworkGridView: View {
    
    @StateObject var viewModel = FrameworkGridViewModel()
    
    let columns: [GridItem] = [GridItem(.flexible()),
                               GridItem(.flexible()),
                               GridItem(.flexible())]
    
    var body: some View {
        ZStack {
            NavigationView {
                ScrollView {
                    LazyVGrid(columns: columns) {
                        
                        ForEach(MockData.frameworks) { framework in
                            FrameworkTitleView(framework: framework)
                            
                                .onTapGesture {
                                    viewModel.selectedFramework = framework
                            }
                        }
                    }
                }
                .navigationTitle("🍎 Frameworks")
                .sheet(isPresented: $viewModel.isShowingDetailView) {
                    FrameworkDetailView(framework: viewModel.selectedFramework ?? MockData.sampleFramework, isShowingDetailView: $viewModel.isShowingDetailView)
                }
            }
        }
    }
}

struct FrameworkTitleView: View {
    
    let framework: Framework
    
    var body: some View {
        VStack {
            Image(framework.imageName)
                .resizable()
                .frame(width: 90, height: 90)
            Text(framework.name)
                .font(.title2)
                .fontWeight(.semibold)
                .scaledToFit()
                .minimumScaleFactor(0.6)
        }
        .padding()
    }
}

struct FrameworkGridView_Previews : PreviewProvider {
    static var previews : some View {
        FrameworkGridView()
            .preferredColorScheme(.dark)
    }
}
