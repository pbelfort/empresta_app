const mockSimulation = {
  "BMG": [
    {"taxa": 2.05, "parcelas": 36, "valor_parcela": 4.72, "convenio": "INSS"},
    {"taxa": 2.05, "parcelas": 48, "valor_parcela": 3.53, "convenio": "INSS"},
    {"taxa": 2.05, "parcelas": 60, "valor_parcela": 3.02, "convenio": "INSS"},
    {"taxa": 2.05, "parcelas": 72, "valor_parcela": 2.6, "convenio": "INSS"},
    {"taxa": 1.9, "parcelas": 84, "valor_parcela": 2.44, "convenio": "INSS"}
  ],
  "PAN": [
    {"taxa": 2.1, "parcelas": 36, "valor_parcela": 3.13, "convenio": "FEDERAL"},
    {"taxa": 2.05, "parcelas": 48, "valor_parcela": 3.43, "convenio": "INSS"},
    {"taxa": 2.08, "parcelas": 72, "valor_parcela": 2.84, "convenio": "INSS"}
  ],
  "OLE": [
    {"taxa": 2.05, "parcelas": 60, "valor_parcela": 3.04, "convenio": "INSS"},
    {"taxa": 2.08, "parcelas": 72, "valor_parcela": 2.84, "convenio": "INSS"}
  ]
};

const mockInstitutions = [
  {"chave": "PAN", "valor": "Pan"},
  {"chave": "OLE", "valor": "Ole"},
  {"chave": "BMG", "valor": "Bmg"}
];

const mockCovenants = [
  {"chave": "INSS", "valor": "INSS"},
  {"chave": "FEDERAL", "valor": "Federal"},
  {"chave": "SIAPE", "valor": "Siape"}
];
