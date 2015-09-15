
    //el output
    String.prototype.print = function(indexBW) {
      console.log('line:'+indexBW+' '+this.replace(/0/g, ' ').replace(/1/g, 'X'));
    };
    //el bit

    String.prototype.xor = function() {
      var result = '',
          inicio = this.slice(0, -1),
          final  = this.slice(1);
      result = zipwith ('0'.concat(inicio) , final.concat('0'));
      return result;
    };

    function zipwith (xs, ys) {
        var res = Array();
        for (var i = 0; i < xs.length; i++) {
          res.push(xs[i] ^ ys[i]);
        };
        return res.join('');
    };


    //madre
    String.prototype.automatacelular = function(inBw, mxBw) {
      //debugger;
      this.print(inBw);
      if (inBw<mxBw)
        this.xor().automatacelular((inBw+1),mxBw);
    };


    "0000000000000000000000000000100000000000000000000000000000".automatacelular(1,25);

