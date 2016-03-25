// The MIT License (MIT) - Copyright (c) 2016 Carlos Vidal
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

import UIKit
import ObjectiveC

infix operator <- {}
public func <- (lhs: UIView, rhs: Attribute) -> [Attribute] {
    return lhs <- [rhs]
}

public func <- (lhs: UIView, rhs: [Attribute]) -> [Attribute] {
    // Disable autoresizing to constraints translation
    lhs.translatesAutoresizingMaskIntoConstraints = false
    
    // Install each one of the params passed to the view given
    for attribute in rhs {
        attribute.installOnView(lhs)
    }
    
    // Store the attributes applied in the superview
    if let superview = lhs.superview {
        superview.easy_attributes.appendContentsOf(rhs)
    }
    
    return rhs
}

public extension UIView {
    
    /**
     
     */
    public func easy_reload() {
        if let attributes = self.superview?.easy_attributes {
            self <- attributes
        }
    }
    
}
