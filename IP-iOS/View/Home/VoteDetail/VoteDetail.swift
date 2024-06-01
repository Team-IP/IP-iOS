//
//  VoteDetail.swift
//  IP-iOS
//
//  Created by 정정욱 on 6/1/24.
//

import SwiftUI

struct VoteDetail: View {
    
    @State var inputText: String = "두 주 전에 만난 남자인 친구와 함께 몇 번의 모임을 가지면서 서로의 취미와 관심사를 공유하게 되었습니다. 그러던 중, 친구가 최근에 연애 상담을 요청하며 다른 사람에게 호감을 가지고 있다고 말했습니다. 그 순간, 당신은 그 친구에게 호감을 느끼고 있음을 깨닫게 되었고, 그가 말한 사람이 혹시 자신일지도 모른다는 희망을 품게 되었습니다. 하지만 만약 그가 다른 사람을 좋아한다면 고백이 친구 관계를 망칠까 봐 고민하게 됩니다."
    
    var body: some View {
        ScrollView {
            VStack {
                VoteDetailHandler(inputText: $inputText)
                    .padding(.top, 50)
                
                VoteDetailBody()
                
                
            }
        }
    }
}

private struct VoteDetailHandler: View {
    @Binding var inputText: String  // 바인딩 변수
    
    fileprivate var body: some View {
        
        VStack(alignment:.leading){
            HStack {
                Text("썸남한테 고백할까 말까")
                    .font(.title)
                    .bold()
                Spacer()
                Text("🌱 30잎")
                    .bold()
            }
            
            Text("2024-06-02까지 참여해보세요🔥")
                .padding(.bottom)
            
            // TexEditor 여러줄 - 긴글 의 text 를 입력할때 사용
            TextEditor(text: $inputText)
                .frame(height: 250) // 크기 설정
            //.colorMultiply(Color.gray.opacity(0.3))
        }
    }
}


private struct VoteDetailBody: View {
    
    fileprivate var body: some View {
        
        VStack(){
            
            VoteButton()
                .padding(.bottom)
            
            HStack(content: {
                HStack {
                    Text("3870")
                        .font(.title)
                        .bold()
                        .foregroundStyle(Color(.ipLine))
                    Text("명 참여")
                        .font(.body)
                }
                Button(action: {
                    
                }, label: {
                    ZStack(content: {
                        Rectangle()
                            .frame(width: 180,height: 50)
                            .foregroundColor(.ipPrimary)
                            .cornerRadius(10.0)
                        Text("투표하기")
                            .foregroundStyle(Color(.ipLine))
                        
                    })
                    
                })
            })
            
            .padding(.bottom, 50)
            
        }
        
    }
}


#Preview {
    VoteDetail()
}
