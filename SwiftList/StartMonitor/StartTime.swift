//
//  StartTime.swift
//  SwiftList
//
//  Created by lingjie on 2021/3/20.
//

import Foundation

struct StartTime {

    
    /// app进程启动时间
    /// - Returns: 基于秒
    static func processStartTime() -> Double {
        let processInfo = ProcessInfo.processInfo
        
        // CTL_KERN 高级核心 /* "high kernel": proc, limits */
        // KERN_PROC  /* struct: process entries */
        // KERN_PROC_PID 
        var cmd = [CTL_KERN, KERN_PROC, KERN_PROC_PID, processInfo.processIdentifier]
        
        var procInfo: kinfo_proc = kinfo_proc()
        var size: Int = MemoryLayout<kinfo_proc>.size
        
        // 0: 成功 -1：失败
        let ret = sysctl(&cmd, 4, &procInfo, &size, nil, 0)
        if ret == -1 {
            fatalError("sysctl调用失败")
        }
        let starttime = procInfo.kp_proc.p_un.__p_starttime
        let countedTime = Double(starttime.tv_sec) + Double(starttime.tv_usec) / 1000.0 / 1000.0
        return countedTime
    }
    
    static func appStartTime() -> Double {
        let finishTime = Date().timeIntervalSince1970
        let startTime = self.processStartTime()
        let time = finishTime - startTime
        print("app启动时间：\(time)")
        return time
    }
    // 官方推荐APP启动时间400ms以内，启动加载动画就是400ms
}
