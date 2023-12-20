import UIKit


//MagicDictionary magicDictionary = new MagicDictionary();
//magicDictionary.buildDict(["hello", “letsuscode"]);
//magicDictionary.search("hello"); // return False
//magicDictionary.search("hhllo"); // We can change the second 'h' to 'e' to match "hello" so we return True
//magicDictionary.search("hell"); // return False
//magicDictionary.search("leetcoded"); // return False


//class MagicDictionary {
//    var sharedDic : [String] = []
//    
//    
//    func search(str : String) -> Bool {
//        if sharedDic.contains(str) {
//            return false
//        }
//        for item in sharedDic {
//            if str.count == item.count {
//                str.
//            }
//        }
//        return false
//    }
//}

//class ViewController: UIViewController {
//    
//    var arr = [1,2,3,4,5,6]
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        print("Arr before : \(arr)")
//        
//       
//        let queue = DispatchQueue(label: "test.queue", attributes: .concurrent)
//        
//      
//        queue.async {
//            self.removeLast()
//        }
//        
//      
//        queue.async {
//            self.removeAll()
//        }
//    }
// 
//    func removeAll() {
//        print("Remove all entry")
//        arr.removeAll()
//        print("Remove all end")
//    }
//    
//    func removeLast() {
//        print("Remove last entry")
//        arr.removeLast()
//        print("Remove last end")
//    }
//}

//let queue = DispatchQueue(label: "test.Queue")
// 
//queue.async {
//    print("In sync operation 1")
//    queue.sync {
//        
//        print("In sync operation 2")
//    }
//}

//Given to Uiview find the common parent of the view
//                 12
//               /     \
//             13       10
//                    /         \
//                 14             15
//                /   \           /  \
//               21   24         22   23

Nodes* k1, k2
var rootNodesOfK1 = []
var rootNodesOfK2 = []

func findNodes(Node* root) {
    if root == nil {
        return
    }
    if root.data == k1.data {
        rootNodesOfK1.append(root.data)
    }
    if root.data == k2.data {
        rootNodesOfK2.append(root.data)
    }
    findNodes(root.left)
    findNodes(root.right)
}

func findCommonNode(Node* root) {
    findNodes(root)
    for i in 1..<rootNodesOfK1.count {
        for j in 1..<rootNodesOfK2.count {
            if rootNodesOfK1[i] == rootNodesOfK2[j] {
                return rootNodesOfK1[i]
            }
        }
    }
    return rootNodesOfK1[0]
}

 
////our main context
let context = self.getContext()
 
DispatchQueue.global().async {
    let fetchRequest: NSFetchRequest<CoreDataObject> = CoreDataObject.fetchRequest()
    do {
        let entity = context.fetch(request: fetchRequest)
    } catch {
        
    }
}
