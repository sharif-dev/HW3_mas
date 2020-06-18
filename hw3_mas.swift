import Foundation

class Node {
    var char: Character
    var x: Int 
    var y: Int 
    var children = Dictionary<Character, Node?>()
    
    init(char:Character ,x : Int, y:Int,children:Dictionary<Character, Node>){
        self.char = char
        self.x = x
        self.y = y
        self.children = children
        
    }
}

class Trie{
    var root : Node
    init() {
        self.root = Node(char: "0", x: -1, y: -1, children: [:])
    }


    func addNode(charList : [Node]) {
        var mainNode = root 
        for node in charList{
            let nextNode = mainNode.children[node.char]
            if (nextNode != nil) {
                mainNode =  nextNode!!
            } else {
                mainNode.children[node.char] = node
                mainNode = node
            }
        }
        
    }
    
    func containWord(string: String) -> Bool{
        var mainNode = root
        for char in string! {
            let nextNode = mainNode.children[char]
            if (nextNode != nil){
                mainNode = nextNode!!
            } else {
                return false
            }
        }
        return true
    }
}

var n = Node(char : "s",x: 1,y: 2,children: [:])
var n1 = Node(char:"r",x: 2,y: 3,children: [:])
var n2 = Node(char: "x", x:1, y:4,children: [:])
var x = Trie()
x.addNode(charList:[n, n1])
x.addNode(charList:[n, n2])
x.addNode(charList:[n2])
print(x.root.children["s"]!!.children)
