//
//  PaginationView.swift
//  RickAndMortyProgress
//
//  Created by Jesus Gonzalez on 10/07/25.
//

import Foundation
import SwiftUI

struct PaginationView: View{
    
    @Binding var currentPage: Int
        let totalPages = 42
        let visibleRange: Int = 5
    
        var body: some View {
            HStack(spacing: 8) {
                Button(action: {
                    if currentPage > 1 {
                        currentPage -= 1
                    }
                }) {
                    Text("<")
                }
                .disabled(currentPage == 1)

                ForEach(pagesToDisplay(), id: \.self) { page in
                    Button(action: {
                        currentPage = page
                    }) {
                        Text("\(page)")
                            .fontWeight(page == currentPage ? .bold : .regular)
                            .foregroundColor(page == currentPage ? .green : .white)
                            .padding(8)
                            .background(page == currentPage ? Color.white : Color.clear)
                            .cornerRadius(8)
                    }
                }

                Button(action: {
                    if currentPage < totalPages {
                        currentPage += 1
                    }
                }) {
                    Text(">")
                }
                .disabled(currentPage == totalPages)
            }
        }

        private func pagesToDisplay() -> [Int] {
            let half = visibleRange / 2
            var start = max(currentPage - half, 1)
            let end = min(start + visibleRange - 1, totalPages)

            if end - start < visibleRange - 1 {
                start = max(end - visibleRange + 1, 1)
            }

            return Array(start...end)
        }
}
