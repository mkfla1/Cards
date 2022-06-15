//
//  CardModal.swift
//  Cards
//
//  Created by shuo zhang on 2022/6/8.
//

enum CardModal: Identifiable {
  var id: Int { hashValue }
  case photoPicker, framePicker, stickerPicker, textPicker
}
