//
//  SimpleJTreeExample.swift
//  SwiftJava
//
//  Created by John Holdsworth on 28/07/2016.
//  Copyright © 2016 John Holdsworth. All rights reserved.
//

// Original Java Version: http://java.happycodings.com/swing/code37.html

import java_lang
import java_awt
import javax_swing

class SimpleJTreeExample: JFrame {

    init( _ title: String ) {
        let frame = try! JFrame( title: title )
        super.init( javaObject: frame.javaObject )
        setSize( 150, 150 )

        class MyWindowAdapter: WindowAdapterBase {
            override func windowClosing( e: WindowEvent? ) {
                //dispose()
                System.exit( 0 )
            }
        }
        addWindowListener( MyWindowAdapter() )

        setup()
        pack()
        setVisible( true )
    }

    required init(javaObject: jobject?) {
        fatalError("init(javaObject:) has not been implemented")
    }

    func setup() {
        let root =  DefaultMutableTreeNode( userObject: JavaString("Calendar") )
        let months = DefaultMutableTreeNode( JavaString("Months") )
        root.add( months )
        let monthLabels = ["January", "February", "March", "April", "May",
                           "June", "July", "August", "September", "October", "November", "December"]
        for i in 0..<monthLabels.count {
            months.add( DefaultMutableTreeNode( JavaString(monthLabels[i]) ) )
        }
        let weeks = DefaultMutableTreeNode( JavaString("Weeks") )
        root.add( weeks )
        let weekLabels = ["Monday", "Tuesday", "Wednesday", "Thursday",
                          "Friday", "Saturday", "Sunday"]
        for i in 0..<weekLabels.count {
            weeks.add( DefaultMutableTreeNode( JavaString(weekLabels[i]) ) )
        }
        let js = JScrollPane( JTree( root ) )
        _ = getContentPane().add( js )
    }
}

