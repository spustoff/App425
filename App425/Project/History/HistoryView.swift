//
//  HistoryView.swift
//  App425
//
//  Created by Вячеслав on 3/27/24.
//

import SwiftUI

struct HistoryView: View {
    
    @StateObject var viewModel = HomeViewModel()
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                Text("History")
                    .foregroundColor(.black)
                    .font(.system(size: 26, weight: .semibold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                
                HStack {
                    
                    ForEach(viewModel.tabs, id: \.self) { index in
                    
                        Button(action: {
                            
                            viewModel.current_tab = index
                            
                        }, label: {
                            
                            Text(index)
                                .foregroundColor(.black)
                                .font(.system(size: 14, weight: .medium))
                                .frame(maxWidth: .infinity)
                                .frame(height: 30)
                                .background(RoundedRectangle(cornerRadius: 10).fill(Color.white.opacity(viewModel.current_tab == index ? 1 : 0)))
                        })
                    }
                }
                .padding(.vertical)
                .padding(.horizontal, 3)
                .frame(height: 35)
                .background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.2)))
                .padding([.horizontal, .bottom])
                
                HStack {
                    
                    Text("Mar 2024")
                        .foregroundColor(.black)
                        .font(.system(size: 19, weight: .semibold))
                    
                    Spacer()
                    
                    Text("$\(viewModel.items.map(\.price).reduce(0,+))")
                        .foregroundColor(.black)
                        .font(.system(size: 19, weight: .semibold))
                }
                .padding(.horizontal)
                
                if viewModel.items.isEmpty {
                    
                    Text("Your subscription list is empty")
                        .foregroundColor(.gray)
                        .font(.system(size: 20, weight: .regular))
                        .multilineTextAlignment(.center)
                        .frame(maxHeight: .infinity, alignment: .center)
                    
                } else {
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        
                        LazyVStack {
                            
                            ForEach(viewModel.current_tab == "Not Active" ? viewModel.items.filter{$0.title == "2"} : viewModel.items, id: \.self) { index in
                            
                                HStack {
                                    
                                    VStack(alignment: .leading, spacing: 5, content: {
                                        
                                        Text(index.title ?? "")
                                            .foregroundColor(.black)
                                            .font(.system(size: 16, weight: .medium))
                                        
                                        Text("$\(index.price)")
                                            .foregroundColor(.black)
                                            .font(.system(size: 13, weight: .medium))
                                    })
                                    
                                    Spacer()
                                    
                                    Text("\((index.startDate ?? Date()).convertDate(format: "MMM d Y"))")
                                        .foregroundColor(Color("primary"))
                                        .font(.system(size: 13, weight: .regular))
                                        .padding(7)
                                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("primary").opacity(0.2)))
                                }
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 15).fill(.white))
                            }
                        }
                        .padding([.horizontal, .bottom])
                    }
                }
            }
        }
        .onAppear {
            
            viewModel.fetchItems()
        }
    }
}

#Preview {
    HistoryView()
}
