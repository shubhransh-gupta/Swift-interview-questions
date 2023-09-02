import Foundation

struct Example
{

    func printNumbers()
    {
        var workItem : DispatchWorkItem?
        workItem = DispatchWorkItem
        {
            for i in 1..<10 {

                guard let wkItem = workItem, !wkItem.isCancelled  else
                {
                    debugPrint("Work item is cancelled")
                    break
                }

                debugPrint("\(i)")
                sleep(1)
            }
        }

        workItem?.notify(queue: .main, execute: {
            debugPrint("done printing numbers or else task is cancelled")
        })

        let queue = DispatchQueue.global(qos: .utility)
        queue.async(execute: workItem!)

        queue.asyncAfter(deadline: .now() + .seconds(3)) {
            workItem?.cancel()
        }
    }

  
}

let obj = Example()
obj.printNumbers()
