//
//  LoadAwareAssembly.swift
//  Swinject
//
//  Created by mike.owens on 12/9/15.
//  Copyright © 2015 Swinject Contributors. All rights reserved.
//

import Swinject


class LoadAwareAssembly: AssemblyType {
    var onLoad: (Resolvable) -> Void
    var loaded = false
    
    init(onLoad: (Resolvable) -> Void) {
        self.onLoad = onLoad
    }
    
    func assemble(container: Container) {
        container.register(AnimalType.self) { r in
            return Cat(name: "Bojangles")
        }
    }
    
    func loaded(resolver: Resolvable) {
        onLoad(resolver)
        loaded = true
    }
}
