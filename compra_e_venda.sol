pragma solidity 0.8.9; 

contract Compra_e_venda {
 
  string comprador; //nome do comprador
  string vendedor; //nome do vendedor
  string matricula;//matricula do imóvel
  string cartorio; //local da matricula do imóvel
  string DataVencimento;
  bool quitado = false; //por ser uma venda a prazo, ele sempre começara como false
  uint ValorTotal; //valor total do imóvel
  uint ValorDaEntrada; //valor da entrada paga pelo imóvel
  uint ValorEmAberto;
  uint ValorDaParcela;
  uint QuantidadeDeParcelas; //compra a prazo
  uint public PorcentagemDaMulta = 10;
 
  constructor
    (uint _valorTotal, uint _quantidadeDeParcelas, uint _ValorEntrada, string memory _matricula, string memory _cartorio)
 
 {    ValorTotal = _valorTotal;
      QuantidadeDeParcelas = _quantidadeDeParcelas;
      ValorDaEntrada = _ValorEntrada;
      matricula = _matricula;
      cartorio = _cartorio;
  }
  
  function PagarEntrada(uint ValorPagamento) public returns(string memory, uint){
      ValorDaEntrada = ValorPagamento;
      ValorEmAberto = ValorTotal - ValorPagamento;
      return("O seu valor em aberto de", ValorEmAberto);
  
  }
   function PagarParcela(uint ValorPagamento) public returns(string memory, uint){
      ValorDaParcela = ValorPagamento;
      ValorEmAberto = ValorEmAberto - ValorDaParcela;
      return("Valor em aberto:", ValorEmAberto);
   } 
   
   function ValorParcela () public view returns (string memory, uint){
       return ("Valor da Parcela:", (ValorTotal - ValorDaEntrada)/QuantidadeDeParcelas);
   }
   
   function ValorMulta () public view returns (string memory, uint){
       return ("Valor da Multa:", (ValorTotal)*PorcentagemDaMulta/100);
   }
}    

