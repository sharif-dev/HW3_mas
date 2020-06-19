import Foundation

class Node {
    var children = Dictionary<Character, Node>()
    var isEnd = false
    init(){
        self.children = Dictionary<Character, Node>() 
        self.isEnd = false
    }
}

class Trie{
    var root : Node
    init() {
        self.root = Node()
    }

    func insert(key:String){
        var node = root
        for char in key{
            var nextNode = node.children[char]
            if nextNode ==  nil{
                nextNode = Node()
                node.children[char] = nextNode
            }
            node = nextNode!
        }
        node.isEnd = true
    }   

    func containWord(string: String) -> Bool{
        var mainNode = root
        for char in string {
            let nextNode = mainNode.children[char]
            if (nextNode != nil){
                mainNode = nextNode!
            } else {
                return false
            }
        }
        return true
    }
    func containFullWord(string: String) -> Bool{
        var mainNode = root
        for char in string {
            let nextNode = mainNode.children[char]
            if (nextNode != nil){
                mainNode = nextNode!
            } else {
                return false
            }
        }
        if mainNode.isEnd {
            return true
        }
        return false
    }
}
// let fullNameArr = fullName.components(separatedBy: " ")



var trie = Trie()
var line = readLine()!
let keys = line.components(separatedBy: " ")
for key in keys{
    trie.insert(key:key)
}
line = readLine()!
let mn = line.components(separatedBy: " ")
let m:Int = Int(mn[0])!
let n:Int = Int(mn[1])!
// print(n)


var charMatrix = Array(repeating: Array(repeating: Character("a"), count: n), count: m)
var charSeen = Array(repeating: Array(repeating: false, count: n), count: m)

for i in 0..<m{
    line = readLine()!
    let chars = line.components(separatedBy: " ")
    for j in 0..<n{
        charMatrix[i][j] = Character(chars[j])
    }
}


func findFromTable(x:Int,y:Int,wordSoFar:String,findedWords:inout [String]){
    if !trie.containWord(string:wordSoFar){
        return
    }
    if trie.containFullWord(string:wordSoFar){
        findedWords.append(wordSoFar)
    }
    charSeen[y][x] = true
    // print(wordSoFar)
    // print(x,y)
    // print(trie.containWord(string:wordSoFar))
    // print()
                
    for i in -1...1{
        for j in -1...1{
            let newX = x+i
            let newY = y+j
            if ((newX >= 0 ) && (newY >= 0) && (newX < n) && (newY < m) && (!charSeen[newY][newX])){
                let newWord = wordSoFar + String(charMatrix[newY][newX])
                // print(newWord,newX,newY)
                findFromTable(x:newX,y:newY,wordSoFar:newWord,findedWords:&findedWords)
            }
            
        }
    }
    charSeen[y][x] = false
}

var words:[String] = []
for i in 0..<m{
    for j in 0..<n{
        findFromTable(x:j,y:i,wordSoFar:String(charMatrix[i][j]),findedWords:&words)
    }
}
// print(words)
// print(charSeen)
let finded = Set(words.map { $0 })
for word in finded{
    print(word)
}



