pragma solidity 0.8.9; 

contract Compra_e_venda {
 
  address comprador; //carteira do comprador
  address vendedor; //carteira do vendedor
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
      vendedor = msg.sender;
  }
  
  function PagarEntrada(uint ValorPagamento) public returns(string memory, uint){
      require(ValorPagamento == ValorDaEntrada, "Valor incorreto");
      require(ValorEmAberto==ValorTotal, "Entrada ja foi paga");
      comprador = msg.sender; //quem clicar n afunção PagarEntrada será o comprador 
      ValorDaEntrada = ValorPagamento;
      ValorEmAberto = ValorTotal - ValorPagamento;
      return("O seu valor em aberto de", ValorEmAberto);
  
  }
   function PagarParcela(uint ValorPagamento) public returns(string memory, uint){
      require(ValorPagamento == ValorDaParcela, "Valor da parcela incorreta");
      require(ValorEmAberto <=ValorTotal - ValorDaEntrada, "Entrada nao foi paga");
      require(comprador == msg.sender, "Obrigado, somente o comprador pode executar essa funcao");
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

