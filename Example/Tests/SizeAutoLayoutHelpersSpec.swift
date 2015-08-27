// https://github.com/Quick/Quick

import Quick
import Nimble
import Drafter

class SizeAutoLayoutHelpersSpec: QuickSpec {

    let view: UIView = UIView()
    let kTestOffsetDefault: CGFloat = 20.0

    override func spec() {

        beforeEach({
            expect(self.view.constraints).to(equal([]))
        })

        afterEach({
            self.view.removeConstraints(self.view.constraints)
        })
        
        describe("SizeAutoLayoutHelpers") {

            context("pinHeight", {

                it("adds constraints with default priority", closure: {
                    self.view.pinHeight(toHeight: self.kTestOffsetDefault)
                    expect(self.view.constraints).toNot(beEmpty())

                    let constraint: NSLayoutConstraint? = self.view.constraints.first

                    expect(constraint?.constant).to(equal(self.kTestOffsetDefault))
                    expect(constraint?.priority).to(equal(UILayoutPriorityRequired))
                })

                it("adds constraints with low priority", closure: {
                    self.view.pinHeight(toHeight: self.kTestOffsetDefault)
                    expect(self.view.constraints).toNot(beEmpty())

                    let constraint: NSLayoutConstraint? = self.view.constraints.first

                    expect(constraint?.constant).to(equal(self.kTestOffsetDefault))
                    expect(constraint?.priority).to(equal(UILayoutPriorityRequired))
                })

            })

            context("pinWidth", {

                it("adds constraints with default priority", closure: {
                    self.view.pinWidth(toWidth: self.kTestOffsetDefault)
                    expect(self.view.constraints).toNot(beEmpty())

                    let constraint: NSLayoutConstraint? = self.view.constraints.first

                    expect(constraint?.constant).to(equal(self.kTestOffsetDefault))
                    expect(constraint?.priority).to(equal(UILayoutPriorityRequired))
                })

                it("adds constraints with low priority", closure: {
                    self.view.pinWidth(toWidth: self.kTestOffsetDefault,
                        priority: UILayoutPriorityDefaultLow)

                    expect(self.view.constraints).toNot(beEmpty())

                    let constraint: NSLayoutConstraint? = self.view.constraints.first

                    expect(constraint?.constant).to(equal(self.kTestOffsetDefault))
                    expect(constraint?.priority).to(equal(UILayoutPriorityDefaultLow))
                })

            })
        }
    }
}
