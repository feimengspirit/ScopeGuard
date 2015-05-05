//
//  ScopeGuard.h
//  ScopeGuard
//
//  Created by mengfei.mf on 5/5/15.
//  Copyright (c) 2015 mengfei.mf. All rights reserved.
//

#include <functional>

#define SCOPEGUARD_LINENAME_CAT(name, line) name##line
#define SCOPEGUARD_LINENAME(name, line) SCOPEGUARD_LINENAME_CAT(name, line)
#define ON_SCOPE_EXIT(callback) feimengspirit::ScopeGuard SCOPEGUARD_LINENAME(EXIT, __LINE__)(callback)

namespace feimengspirit
{
class ScopeGuard
{
public:
    explicit ScopeGuard(std::function<void()> onExitScope)
    :onExitScope_(onExitScope), dismissed_(false) { }
    
    ~ScopeGuard()
    {
        if (!dismissed_) { onExitScope_(); }
    }
    
    void Dismiss() //用作回滚
    {
        dismissed_ = true;
    }
private:
    ScopeGuard(const ScopeGuard&);
    ScopeGuard& operator=(const ScopeGuard&);
    
private:
    std::function<void()> onExitScope_;
    bool dismissed_;
};
}