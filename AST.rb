class AST
  # attr_accessor :down
  # attr_accessor :right
  # attr_accessor :token

   def initialize(tok)
      @token = tok
      @down = nil
      @right = nil
   end
   
   def get_token()
      return @token
   end
   
   def set_token(x)
      @token = x
   end

   def addChild(node)
      if (node == nil) then return nil end
      t = @down
      if (t != nil)
         while (t.getNextSibling() != nil)
             t = t.getNextSibling()
         end
         t.setNextSibling(node)
      else
         self.setFirstChild(node)
      end
   end

   def addChildNext(node)
      if (node == nil) then return nil end
      t = self.getFirstChild()
      if (t != nil)
          while (t.getFirstChild() != nil)
              t = t.getFirstChild()
          end
          t.setFirstChild(node)
      else
          self.setFirstChild(node)
      end
  end

   def getFirstChild()
      return @down
   end
   
   def setFirstChild(c)
       @down = c
   end

   def swapSibling()
      t = self
      if (t.getFirstChild() != nil)
          node_top_subling = t.getNextSibling()
          t.setNextSibling(nil)
          while (t.getFirstChild() != nil and node_top_subling != nil)
              temp = t.getFirstChild().getNextSibling()
              t.getFirstChild().setNextSibling(node_top_subling)
              node_top_subling = temp
              t = t.getFirstChild()
          end
      end
  end

   def getNextSibling()
      return @right
   end
   
   def setNextSibling(n)
      @right = n
   end
   
   def to_s
     return @token.to_s
   end
   
   def toStringList
      t = self
      ts = ""
      if (t.getFirstChild() != nil)then ts += " (" end
      ts += " #{self.to_s()}"
      if (t.getFirstChild() != nil)
         ts += t.getFirstChild().toStringList()
      end
      if (t.getFirstChild() != nil)then  ts += " )" end
      if (t.getNextSibling() != nil)
         ts += t.getNextSibling().toStringList()
      end
      return ts
   end
end
