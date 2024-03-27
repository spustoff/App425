//
//  HomeAdd.swift
//  App425
//
//  Created by Вячеслав on 3/27/24.
//

import SwiftUI

struct HomeAdd: View {
    
    @StateObject var viewModel: HomeViewModel
    @Environment(\.presentationMode) var router
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                VStack {
                    
                    RoundedRectangle(cornerRadius: 15)
                        .fill(.gray.opacity(0.3))
                        .frame(width: 50, height: 5)
                        .padding(.top)
                    
                    ZStack {
                        
                        Text("Create an Item")
                            .foregroundColor(.black)
                            .font(.system(size: 18, weight: .semibold))
                        
                        HStack {
                            
                            Button(action: {
                                
                                router.wrappedValue.dismiss()
                                
                            }, label: {
                                
                                Image(systemName: "xmark")
                                    .foregroundColor(.white)
                                    .font(.system(size: 10, weight: .bold))
                                    .frame(width: 20, height: 20)
                                    .background(Circle().fill(.gray.opacity(0.7)))
                            })
                            
                            Spacer()
                        }
                    }
                    .padding()
                }
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    LazyVStack {
                        
                        HStack {
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("Title")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 15, weight: .regular))
                                    .opacity(viewModel.title.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.title)
                                    .foregroundColor(.black)
                                    .font(.system(size: 15, weight: .regular))
                            })
                            
                            Spacer()
                        }
                        .padding()
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 15).fill(.white))
                        
                        HStack {
                            
                            Text("Start Date")
                                .foregroundColor(.gray)
                                .font(.system(size: 15, weight: .regular))
                            
                            Spacer()
                            
                            DatePicker(selection: $viewModel.startDate, displayedComponents: .date, label: {})
                                .labelsHidden()
                        }
                        .padding()
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 15).fill(.white))
                        
                        HStack {
                            
                            Text("End Date")
                                .foregroundColor(.gray)
                                .font(.system(size: 15, weight: .regular))
                            
                            Spacer()
                            
                            DatePicker(selection: $viewModel.endDate, displayedComponents: .date, label: {})
                                .labelsHidden()
                        }
                        .padding()
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 15).fill(.white))
                        
                        HStack {
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("Price")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 15, weight: .regular))
                                    .opacity(viewModel.price.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.price)
                                    .foregroundColor(.black)
                                    .font(.system(size: 15, weight: .regular))
                                    .keyboardType(.decimalPad)
                            })
                            
                            Spacer()
                        }
                        .padding()
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 15).fill(.white))
                        
                        Button(action: {
                            
                            viewModel.addItem()
                            viewModel.fetchItems()
                            
                            router.wrappedValue.dismiss()
                            
                            viewModel.title = ""
                            viewModel.price = ""
                            
                        }, label: {
                            
                            Text("Save")
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .medium))
                                .frame(maxWidth: .infinity)
                                .frame(height: 50)
                                .background(RoundedRectangle(cornerRadius: 10).fill(Color("primary")))
                        })
                        .opacity(viewModel.title.isEmpty || viewModel.price.isEmpty ? 0.5 : 1)
                        .disabled(viewModel.title.isEmpty || viewModel.price.isEmpty ? true : false)
                        
                    }
                    .padding()
                }
            }
        }
    }
}

#Preview {
    HomeAdd(viewModel: HomeViewModel())
}
