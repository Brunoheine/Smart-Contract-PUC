pragma solidity 0.8.9; 

contract Compra_e_venda {
 
  string comprador;
  string vendedor;
  string matricula;//matricula do imóvel
  string cartorio; //local da matricula do imóvel
  string DataVencimento;
  bool quitado = false; //por ser uma venda a prazo, ele sempre começara como false
  uint ValorTotal; //valor total do imóvel
  uint ValorDaEntrada; //valor da entrada paga pelo imóvel
  uint ValorEmAberto;
  uint ValorDaParcela;
  uint QuantidadeDeParcelas; //compra a prazo
  uint PorcentagemDaMulta;
 
  function PagarEntrada(uint ValorPagamento) public returns(string memory, uint){
      ValorDaEntrada = ValorPagamento;
      ValorEmAberto = ValorTotal - ValorPagamento;
      return("O seu valor em aberto de", ValorEmAberto);
  
  }
 
}    

