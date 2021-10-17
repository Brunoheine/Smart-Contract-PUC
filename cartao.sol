pragma solidity 0.8.9;

 // 1º Contrato do Bruno Heine Peixoto
 // contrato sobre cartão de vacinação
 
 contract CartaoDeVacinacao {
     
     string constant public nome = "JOAO";
     uint constant public CNES = 113160210;
     string constant public Data = "14/10/2020"; 
     uint private lote = 100;
     string private fabricante;
     string constant public vacinador = "pfizer";
     bool public imunizado = false;
     address private wallet;
     
     
 }
