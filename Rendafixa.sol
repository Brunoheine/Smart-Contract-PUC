pragma solidity 0.8.9; 

contract RendaFixa 
{

    string NomeInvestidor;
    uint ValorInicialInvestido;
    uint TaxaJurosMensal;
    uint TempoContrato_Meses;
    uint ValorFinal;
    
    constructor (string memory _NomeInvestidor, uint _ValorInicial, uint _TaxaJurosMensal) //, uint _Meses)
    
    {   NomeInvestidor = _NomeInvestidor;
        ValorInicialInvestido = _ValorInicial;
        TaxaJurosMensal = _TaxaJurosMensal;
        //TempoContrato_Meses = _Meses;
    }
        
    function TempoDeInvestimento_Meses (uint _MesesAteResgate) public  
    {
        ValorFinal= ValorInicialInvestido+ValorInicialInvestido/100*(TaxaJurosMensal*_MesesAteResgate);
        TempoContrato_Meses = _MesesAteResgate;
        
    }
    
    function ValorTotalResgate () public view returns(string memory, string memory, uint, string memory, uint, string memory)
   
    {    return (NomeInvestidor, "voce tera", ValorFinal, "daquia a", TempoContrato_Meses, "meses");
    }
    
    function RendimentoPeriodo () public view returns(string memory, uint)
    
    {   return ("Seu rendimento no periodo sera de:", ValorFinal - ValorInicialInvestido);}
    
    
}
