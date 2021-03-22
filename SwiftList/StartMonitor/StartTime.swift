//
//  StartTime.swift
//  SwiftList
//
//  Created by lingjie on 2021/3/20.
//

import Foundation

struct StartTime {
    static func processStartTime() -> Double {
        let processInfo = ProcessInfo.processInfo
        
        var cmd = [CTL_KERN, KERN_PROC, KERN_PROC_PID, processInfo.processIdentifier]
        
        var procInfo: kinfo_proc = kinfo_proc()
        var size: Int = MemoryLayout<kinfo_proc>.size
        
        // 0: 成功 -1：失败
        let ret = sysctl(&cmd, 4, &procInfo, &size, nil, 0)
        let starttime = procInfo.kp_proc.p_un.__p_starttime
        let countedTime = Double(starttime.tv_sec) * 1000.0 + Double(starttime.tv_usec) / 1000.0
        print("sysctl-->\(ret), time---->\(countedTime)")
        return countedTime
    }
}
