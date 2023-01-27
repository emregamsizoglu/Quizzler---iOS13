//
//  QuizBrain.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 08/08/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//
import Foundation

struct QuizBrain {
    
    var questionNumber = 0
    var score = 0
    
    let quiz = [
        Question(q: "Arabayı hızlı ve tehlikeli kullanmayı severim", a: "ÖYLEYİM"),
        Question(q: "Anlık foto çekilmesine müsade ederim", a: "DEĞİLİM"),
        Question(q: "Yemek yerken çok tatlı olurum (Ben hep tatlıyımdır)", a: "ÖYLEYİM"),
        Question(q: "Asla beste dinlemem ve söylemem", a: "DEĞİLİM"),
        Question(q: "Finallerim çok iyi geçicek ve hepsinden 100 alıcam", a: "ÖYLEYİM"),
        Question(q: "Ne giyersem giyiyim yakışır", a: "ÖYLEYİM"),
        Question(q: "Bazen hırçın olabiliyorum", a: "DEĞİLİM"),
        Question(q: "Ayna gördüğüm zaman hemen foto çekilirim", a: "ÖYLEYİM"),
        Question(q: "Kollarım ve bacaklarım 360 derece dönebiliyor", a: "ÖYLEYİM"),
        Question(q: "Tekirdağ'lı olduğum için asla sarhoş olmam", a: "DEĞİLİM"),
        Question(q: "Dünyanın en güzel gözlerine sahibim", a: "ÖYLEYİM"),
        Question(q: "Testimiz bitmiştir!", a: "ÖYLEYİM")
    ]
    
    func getQuestionText() -> String {
        return quiz[questionNumber].text
    }
    
    func getProgress() -> Float {
        return Float(questionNumber) / Float(quiz.count)
    }
    
    mutating func getScore() -> Int {
        return score
    }
    
     mutating func nextQuestion() {
        
        if questionNumber + 1 < quiz.count {
            questionNumber += 1
        } else {
            score = 0
            questionNumber = 0
        }
    }
    
    mutating func checkAnswer(userAnswer: String) -> Bool {
        if userAnswer == quiz[questionNumber].answer {
            score += 1
            return true
        } else {
            return false
        }
    }
}

